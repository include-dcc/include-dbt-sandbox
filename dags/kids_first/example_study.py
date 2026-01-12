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
    profile_name=os.environ["DBT_PROFILE_NAME"],
    profiles_yml_filepath=os.environ["DBT_PROFILES_YML_PATH"],
    target_name="prd",
)

example_study_dag = DbtDag(
    project_config=ProjectConfig(
        os.environ["DBT_PROJECT_DIR"],
        install_dbt_deps=True,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(
        dbt_executable_path=os.environ["DBT_EXECUTABLE_PATH"],
    ),
    render_config=RenderConfig(select=["config.meta.study:kf_example_study"]),
    # normal dag parameters
    schedule="@daily",
    dag_id="kf_example_study",
    tags=["POC", "Kids First"],
)
