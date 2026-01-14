import os
from airflow.sdk import Variable
from datetime import datetime

from cosmos import (
    DbtDag,
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
    RenderConfig,
)

profile_config = ProfileConfig(
    profile_name=Variable.get("DBT_PROFILE_NAME"),
    profiles_yml_filepath=Variable.get("DBT_PROFILES_YML_PATH"),
    target_name="prd",
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
    dag_id="kf_example_study",
    tags=["POC", "Kids First"],
)
