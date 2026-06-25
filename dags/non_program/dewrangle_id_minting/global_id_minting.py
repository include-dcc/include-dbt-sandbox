"""Boilerplate DAG that reads from a PostgreSQL table and saves to a local file."""

from datetime import datetime
import csv
import logging

from airflow.models.dag import DAG
from airflow.models import Param
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.hooks.base import BaseHook
import psycopg2

logger = logging.getLogger(__name__)


with DAG(
	dag_id="global_id_minting",
	description="Read from PostgreSQL table and export to CSV file.",
	start_date=datetime(2024, 1, 1),
	schedule=None,
	catchup=False,
	params={
		"table_name": Param(
			default="default_table",
			type="string",
			title="Table Name",
			description="Name of the table to query from the database",
		),
		"schema_name": Param(
			default="default_schema",
			type="string",
			title="Schema Name",
			description="Schema name where the table resides",
		),
	},
	tags=["example", "postgres", "export"],
) as dag:

	def read_table_to_file(**context):
		"""Read from PostgreSQL table and save to local file."""
		schema_name = context["params"]["schema_name"]
		table_name = context["params"]["table_name"]
		
		# Get Airflow connection
		conn = BaseHook.get_connection("postgres_prd_svc")
		
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
	)

	wc_output_file = BashOperator(
		task_id="wc_output_file",
		bash_command="wc {{ ti.xcom_pull(task_ids='read_and_export') }}",
	)

	read_and_export >> wc_output_file
