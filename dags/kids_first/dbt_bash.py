from datetime import datetime, timedelta
from airflow.sdk import Variable
import os

# The DAG object; we'll need this to instantiate a DAG
from airflow.models.dag import DAG

# Operators; we need this to operate!
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

with DAG(
    "dbt_bash_status",
    # These args will get passed on to each operator
    # You can override them on a per-task basis during operator initialization
    default_args={
        "depends_on_past": False,
        "email": ["airflow@example.com"],
        "email_on_failure": False,
        "email_on_retry": False,
        "retries": 1,
        "retry_delay": timedelta(minutes=5),
        # 'queue': 'bash_queue',
        # 'pool': 'backfill',
        # 'priority_weight': 10,
        # 'end_date': datetime(2016, 1, 1),
        # 'wait_for_downstream': False,
        # 'sla': timedelta(hours=2),
        # 'execution_timeout': timedelta(seconds=300),
        # 'on_failure_callback': some_function, # or list of functions
        # 'on_success_callback': some_other_function, # or list of functions
        # 'on_retry_callback': another_function, # or list of functions
        # 'sla_miss_callback': yet_another_function, # or list of functions
        # 'on_skipped_callback': another_function, #or list of functions
        # 'trigger_rule': 'all_success'
    },
    description="Provide dbt information",
    schedule=timedelta(days=1),
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=["POC"],
) as dag:

    # t1, t2 and t3 are examples of tasks created by instantiating operators
    t1 = BashOperator(
        task_id="dbt_version",
        bash_command=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt --version",
    )

    def check_for_warehouse_host_var():
        warehouse_host = Variable.get("INCLUDEWAREHOUSE_HOST", default_var=None)
        if warehouse_host:
            print("WAREHOUSE_HOST exists!")
        else:
            print("WAREHOUSE_HOST variable is not set.")

    t2 = PythonOperator(
        task_id="check_for_warehouse_host_var",
        python_callable=check_for_warehouse_host_var,
    )
