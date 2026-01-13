import os
from datetime import datetime

from cosmos import (
    DbtDag,
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
    RenderConfig,
)

profile_config = ProfileConfig(
    profile_name=os.environ.get("DBT_PROFILE_NAME", "default"),
    profiles_yml_filepath=os.environ.get("DBT_PROFILES_YML_PATH", "default"),
    target_name="prd",
)

example_study_dag = DbtDag(
    project_config=ProjectConfig(
        os.environ.get("DBT_PROJECT_DIR", "default"),
        install_dbt_deps=True,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=os.environ.get("DBT_EXECUTABLE_PATH", "default"),
    ),
    render_config=RenderConfig(select=["config.meta.study:kf_example_study"]),
    # normal dag parameters
    schedule="@daily",
    dag_id="kf_example_study",
    tags=["POC", "Kids First"],
)
