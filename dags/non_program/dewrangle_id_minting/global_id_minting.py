"""DAG to mint Global IDs in Dewrangle for a given PostgreSQL table with descriptors."""

from datetime import datetime
import csv
import logging

from airflow.models.dag import DAG
from airflow.models import Param
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator

try:
    from airflow.sdk.bases.hook import BaseHook
except (
    ImportError
):  # Since Airflow 3.1, the BaseHook is in the airflow.sdk.bases.hook module
    from airflow.hooks.base import BaseHook
import psycopg2

logger = logging.getLogger(__name__)


with DAG(
    dag_id="global_id_minting",
    description="""
    	Given a PostgreSQL table with descriptors, generate global IDs and load
		those IDs into a target table.
		""",
    start_date=datetime(2026, 6, 1),
    schedule=None,
    catchup=False,
    params={
        "descriptor_schema_name": Param(
            default="default_schema",
            type="string",
            title="Descriptor Schema Name",
            description="Schema name where the table with descriptors that need global IDs is located",
        ),
        "descriptor_table_name": Param(
            default="default_table",
            type="string",
            title="Descriptor Table Name",
            description="Name of the table with descriptors that need global IDs",
        ),
        "globalid_schema_name": Param(
            default="default_schema",
            type="string",
            title="Global ID Schema Name",
            description="Schema name where the table with generated global IDs is located",
        ),
        "globalid_table_name": Param(
            default="default_table",
            type="string",
            title="Global ID Table Name",
            description="Name of the table with generated global IDs",
        ),
        "create_new_globalid_table": Param(
            default=False,
            type="boolean",
            title="Create New Global ID Table",
            description="Whether to create a new table for the generated global IDs or not",
        ),
        "env": Param(
            default="qa",
            type="string",
            title="Environment",
            description="Environment for the global ID minting command",
            enum=["qa", "prod"],
        ),
        "dewrangle_organization_id": Param(
            default="T3JnYW5pemF0aW9uOmNtZjJ3bzlrdDAwMG9rMTAxcHd4cHFmMWQ=",
            type="string",
            title="Dewrangle Organization ID",
            description="Organization ID for the dewrangle global ID minting command",
            enum=[
                "T3JnYW5pemF0aW9uOmNtZjJ3bzlrdDAwMG9rMTAxcHd4cHFmMWQ=",
                "T3JnYW5pemF0aW9uOmNsZHN4MzRrbjAwMTRnMGVzY3JndzUzYWQ=",
                "T3JnYW5pemF0aW9uOmNsZWhibTF4ZjAwZTdpY2VzZjI0d2tlNHk=",
            ],
            values_display={
                "T3JnYW5pemF0aW9uOmNtZjJ3bzlrdDAwMG9rMTAxcHd4cHFmMWQ=": "dff dev",
                "T3JnYW5pemF0aW9uOmNsZHN4MzRrbjAwMTRnMGVzY3JndzUzYWQ=": "Kids First DRC",
                "T3JnYW5pemF0aW9uOmNsZWhibTF4ZjAwZTdpY2VzZjI0d2tlNHk=": "INCLUDE DCC",
            },
        ),
    },
    tags=["non_program", "id_minting", "dewrangle"],
) as dag:

    # Get Airflow connection
    postgres_conn = BaseHook.get_connection("postgres_prd_svc")
    dewrangle_conn = BaseHook.get_connection("dewrangle_api")

    def read_table_to_file(conn=postgres_conn, **context):
        """Read from PostgreSQL table and save to local file."""
        schema_name = context["params"]["descriptor_schema_name"]
        table_name = context["params"]["descriptor_table_name"]

        # Connect to PostgreSQL
        connection = psycopg2.connect(
            host=conn.host,
            port=conn.port or 5432,
            database=conn.schema,
            user=conn.login,
            password=conn.password,
        )

        cursor = connection.cursor()

        # Query the table
        query = f"SELECT * FROM {schema_name}.{table_name}"
        cursor.execute(query)

        # Get column names
        column_names = [desc[0] for desc in cursor.description]
        rows = cursor.fetchall()

        logger.info(f"Column names: {column_names}")
        logger.info(f"Number of rows: {len(rows)}")

        # Save to local file
        output_file = f"/tmp/{schema_name}_{table_name}_export.csv"
        with open(output_file, "w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(column_names)
            writer.writerows(rows)

        cursor.close()
        connection.close()

        logger.info(f"Data exported to {output_file}")
        return output_file

    read_and_export = PythonOperator(
        task_id="read_and_export",
        python_callable=read_table_to_file,
        op_kwargs={
            "conn": postgres_conn,
        },
    )

    {set create_dewrangle_ids_table_flag = "--create-dewrangle-ids-table" if dag.params["create_new_globalid_table"] else ""}

    create_dewrangle_ids_table_flag = (
        "--create-dewrangle-ids-table"
        if dag.params["create_new_globalid_table"]
        else ""
    )

    mint_ids = BashOperator(
        task_id="mint_ids",
        bash_command="${ID_MINTING_PATH}/bin/d3b-dewrangle global-id-mint --env {{ params.env }} --db dcc --organization-id {{ params.dewrangle_organization_id }} --manifest {{ ti.xcom_pull(task_ids='read_and_export') }} {{ create_dewrangle_ids_table_flag }}",
        env={
            "QA_DCC_WAREHOUSE_DEWRANGLE_IDS_SCHEMA": "{{ params.globalid_schema_name }}",
            "QA_DCC_WAREHOUSE_DEWRANGLE_IDS_TABLE": "{{ params.globalid_table_name }}",
            "PROD_DCC_WAREHOUSE_DEWRANGLE_IDS_SCHEMA": "{{ params.globalid_schema_name }}",
            "PROD_DCC_WAREHOUSE_DEWRANGLE_IDS_TABLE": "{{ params.globalid_table_name }}",
            "DCC_WAREHOUSE_HOST": postgres_conn.host,
            "DCC_WAREHOUSE_PORT": str(postgres_conn.port or 5432),
            "DCC_WAREHOUSE_DB_NAME": postgres_conn.schema,
            "DCC_WAREHOUSE_DB_USER": postgres_conn.login,
            "DCC_WAREHOUSE_DB_USER_PW": postgres_conn.password,
            "DEWRANGLE_BASE_URL": dewrangle_conn.host,
            "DEWRANGLE_TOKEN": dewrangle_conn.password,
            "DEWRANGLE_CLIENT_EXECUTION_TIMEOUT": "300",
        },
    )

    read_and_export >> mint_ids
