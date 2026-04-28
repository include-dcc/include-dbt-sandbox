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
    profile_name=Variable.get("DBT_PROFILE_NAME"),
    target_name="prd",
    profile_mapping=PostgresUserPasswordProfileMapping(
        conn_id="postgres_prd_svc",
        profile_args={"schema": "prd"},
    ),
)

aadsc_dag = DbtDag(
    project_config=ProjectConfig(
        Variable.get("DBT_PROJECT_DIR"),
        install_dbt_deps=True,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=Variable.get("DBT_EXECUTABLE_PATH"),
    ),
    render_config=RenderConfig(exclude=["tag:[study_level,export_stage]"]),
    schedule="@monthly",
    dag_id="combined_access_dbt_dag",
    tags=["combined_stage", "access_stage"],
)
