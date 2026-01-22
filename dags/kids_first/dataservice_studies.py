from airflow.sdk import Variable

from cosmos import (
    DbtDag,
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
    RenderConfig,
)
from cosmos.profiles import PostgresUserPasswordProfileMapping

profile_config = ProfileConfig(
    # make sure target_name and profile_mapping align
    profile_name=Variable.get("DBT_PROFILE_NAME"),
    target_name="prd",
    profile_mapping=PostgresUserPasswordProfileMapping(
        conn_id="postgres_prd_svc",
        profile_args={"schema": "prd"},
    ),
)

example_study_dag = DbtDag(
    project_config=ProjectConfig(
        Variable.get("DBT_PROJECT_DIR"),
        install_dbt_deps=True,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=Variable.get("DBT_EXECUTABLE_PATH"),
    ),
    render_config=RenderConfig(select=["config.meta.study:kf_example_study"]),
    # normal dag parameters
    schedule="@daily",
    dag_id="kf_dataservice_studies",
    tags=["POC", "Kids First"],
)