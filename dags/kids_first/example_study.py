import os
from datetime import datetime, timedelta

from cosmos import (
    DbtDag,
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
    RenderConfig,
)

profile_config = ProfileConfig(
    profile_name="d3b_study_transform",
    target_name="dev",
    profiles_yml_filepath="/opt/airflow/dbt/profiles.yml",
)

access_dag = DbtDag(
    project_config=ProjectConfig(
        "/opt/airflow/dbt/deidentified_etl",
        # todo uncomment the line below and remove the corresponding,
        # `install_deps` operator arg
        # install_dbt_deps=True, #this is a feature coming in v1.9
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",
    ),
    render_config=RenderConfig(select=["config.meta.study:kf_example_study"]),
    operator_args={
        "install_deps": True,
    },
    # normal dag parameters
    schedule="@daily",
    start_date=datetime(2026, 1, 1),
    catchup=False,
    dag_id="kf_example_study",
    tags=["POC", "Kids First"],
    # default_args={"retries": 2},
)
