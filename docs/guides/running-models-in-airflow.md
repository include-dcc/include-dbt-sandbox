# How to Run dbt in Airflow

This guide discusses how dbt models may be run in Airflow and the file
configuration that is needed to run those models.

## How Airflow Runs dbt Models

The Airflow instance that is used to orchestrate data pipelines is hosted in
AWS using Managed Workflow for Apache Airflow (MWAA). MWAA provides a simple way
for the Airflow instance - as well as its workers to be provisioned and
dispatched. As of the writing of this guide, the MWAA instance used by these
workflows is utilizing Airflow version 3.0.6 and python version 3.12.

To run dbt models, we utilize [`cosmos`](https://astronomer.github.io/astronomer-cosmos/index.html).
`cosmos` is a python library written for Airflow that has operators that use dbt
and convert sets of dbt models within a dbt project into DAGs. While an older
approach may have specified running dbt models via a bash command within an
airflow bash operator, using the `cosmos` `DbtDag` operator allows individual
models and those models' tests to be materialized as individual tasks.

For a dbt model - or set of models - to be picked up by Airflow and run, those
models need to be referenced by a DAG.

### Getting files into MWAA

When pull requests are merged into main branch in this repository, a GitHub
action is triggered to mirror the contents of this repository into the s3 bucket
that MWAA uses to store models and DAGs.

## How to write a DAG file

A DAG that runs dbt models has three important parts that are needed for those
models to run:

1. imports
2. profile configuration
3. the model DAG

### Example DAG

An example DAG is below. Its components will be described in the following
sections. The purpose of this DAG is to run models in the study
`kf_example_study` every day.

```python
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
        conn_id="postgres_dev_svc",
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
    dag_id="kf_example_study",
    tags=["POC", "Kids First"],
)
```

### Imports

This section has all of the packages and modules that are needed for the DAG
file to run. An important set of items that need to be imported are the cosmos
imports that have both the `DbtDag` operator and the appropriate cosmos
`Config`s. Information about different configuration modules used by cosmos
is [here](https://astronomer.github.io/astronomer-cosmos/configuration/index.html).

Minimally for cosmos, the below is needed:

```python
from cosmos import (
    DbtDag,
    ProjectConfig,
    ProfileConfig,
    ExecutionConfig,
    RenderConfig,
)
from cosmos.profiles import PostgresUserPasswordProfileMapping
```

In the example, the `from airflow.sdk import Variable` is used to extract
environment variables in the airflow environment used by commands in the DAG.

### `profile_config`

The `profile_config` is used by cosmos to identify the profile to be used by dbt
commands. The value for `profile_name` should use the indicated variables. Acceptable values for `target_name` are `qa` and `prd`.

The `profile_mapping` takes advantage of an airflow connection object to connect
to the warehouse. Pass it the indicated connection id and make sure to set the
`schema` appropriately for the `target_name`

### the model DAG

The model DAG(s) python object can be named whatever makes the most sense for
the DAG

[`project_config`](https://astronomer.github.io/astronomer-cosmos/configuration/project-config.html),
[`profile_config`](https://astronomer.github.io/astronomer-cosmos/profiles/index.html),
and [`execution_config`](https://astronomer.github.io/astronomer-cosmos/configuration/execution-config.html)
will look identical between DAGs and should follow the model of this example.
More information about these configurations is linked.

[`render_config`](https://astronomer.github.io/astronomer-cosmos/configuration/render-config.html)
is used to identify what dbt model(s) should be run and follow dbt's `--select`
behavior. More information about using `RenderConfig` to select models can be
found [here](https://astronomer.github.io/astronomer-cosmos/configuration/selecting-excluding.html).

The rest of the DAG's parameters are familiar to other airflow operators.

* `schedule` indicates how often a DAG should be run
* `dag_id` is the identifier for the DAG within airflow and should follow the
  form `{program}_{study}`.
* `tags` is used to tag the DAG and should minimally have a tag for the program
  the DAG corresponds to.

## Required components of models

To be picked up by airflow, all that is required for models is that they have
the corresponding filtering criteria used in the `select` of the `RenderConfig`.

In this example, the `meta` `config` property `study` was created and used to
filter models.
