---
# These are optional metadata elements. Feel free to remove any of them.
status: proposed
date: 2025-11-20
---

# DBT Project Structure

## Context

There needs to be cohesive organization of the dbt project that will hold
transformation models for INCLUDE and Kids First program studies. A decision
needs to be made regarding what this structure of the dbt project will take,
particularly in regards to organization of dbt models.

## Decision

The directory tree structure below displays the chosen dbt project organization.

```plaintext
dbt_project/
|-- packages.yml
|-- profiles.yml
|-- dbt_project.yml
|-- .github/
|   |-- PULL_REQUEST_TEMPLATE.md
|   `-- workflows/
|       |-- deployment_workflow.yml
|       `-- linting_workflow.yml
|-- analysis
|-- scripts
|-- snapshots
|-- tests
|-- seeds/
|   |-- _seeds.yml
|   |-- hpo_mapping.csv
|   `-- more_mapping.csv
|-- macros/
|   |-- _macros.yml
|   `-- some_macro.sql
`-- models/
    `-- include/
        |-- aggregation_layer/
        |   |-- _access/
        |   |   |-- _access__docs.md
        |   |   |-- _access__models.yml
        |   |   |-- inc_participants_access.sql
        |   |   `-- inc_specimens_access.sql
        |   `-- export/
        |       |-- _export__docs.md
        |       |-- fhir/
        |       |   |-- _exp_fhir__models.yml
        |       |   |-- _exp_fhir__docs.md
        |       |   |-- exp_fhir_observation.sql
        |       |   `-- exp_fhir_specimen.sql
        |       |-- portal/
        |       |   |-- _exp_portal__models.yml
        |       |   `-- exp_portal_participants.sql
        |       `-- reporting/
        |           |-- _exp_reporting__models.yml
        |           `-- exp_reporting_diagnoses.sql
        `-- study_layer/
            |-- foo/
            |   |-- _inc_foo__sources.yml
            |   |-- _inc_foo__docs.md
            |   |-- internal/
            |   |   |-- _inc_foo_internal__models.yml
            |   |   |-- inc_foo_int_abc.sql
            |   |   `-- inc_foo_int_def.sql
            |   `-- stable/
            |       |-- _foo_stable__models.yml
            |       |-- inc_foo_stable_participants.sql
            |       `-- inc_foo_stable_specimen.sql
            `-- baz/
                |-- _inc_baz__sources.yml
                |-- _inc_baz__docs.md
                |-- internal/
                |   |-- _inc_baz_internal__models.yml
                |   |-- inc_baz_int_abc.sql
                |   `-- inc_baz_int_def.sql
                `-- stable/
                    |-- _inc_baz_stable__models.yml
                    |-- inc_baz_stable_participants.sql
                    `-- inc_baz_stable_specimen.sql
```

The files and directories in the proposed directory structure are described
below:

* **`packages.yml`** is a configuration file used by dbt for indicating what dbt
  project packages a dbt project uses, such as packages that may be found on dbt
  Hub
* **`profiles.yml`** is a configuration file used by dbt with connection
  in formation for each environment for which the dbt project is deployed
  (e.g prod, qa, and dev). Secrets are stored in environment variables and
  accessed within this file using the `env_var()` macro.
* **`dbt_project.yml`** is a configuration file used by dbt which contains
  important metadata about the dbt project.
* **`analysis`** is a directory used by dbt to hold analysis scripts. These
  scripts are ones that may not necessarily make sense as a model but should
  still be in version control.
* **`seeds`** is a directory used by dbt to hold csv files that dbt loads into
  the warehouse. Seeds are usually mapping files and should not be raw data to
  be loaded or contain sensitive information. These seed files are to be
  documented in a file `_seeds.yml`. The contents of this file are documented
  [here](https://docs.getdbt.com/reference/seed-properties).
* **`macros`** is a directory used by dbt to hold scripts with blocks of code
  that can be re-used multiple times within the project. These macros are to be
  documented in a file `_macros.yml`. The contents of this file are documented
[here](https://docs.getdbt.com/reference/macro-properties).
* **`snapshots`** is a directory used by dbt for defining table snapshots
* **`tests`** is a directory used by dbt for scripts testing multiple tables
  simultaneously.
* **`models`** is a directory used by dbt to hold modeling scripts. The
  contents of this directory are discussed in detail below.

### `models` Organization

The diagram below displays a conceptual layout for the `models` directory:

![Diagram of the models directory](./adr-003-dbt-project-structure.excalidraw.svg)

The models directory will have two subdirectories at its root, one for each
program, INCLUDE and Kids First. Each of these directories will have two
directories inside of it. The first of these is `study_layer` and the second is
`aggregation_layer`.

The `study_layer` will have a directory for each study (in the example above,
there are two studies, `foo` and `baz`). Inside of each study is a file that
defines the source data for the study (named `[_[study_name]__sources.yml`) and
two directories:`internal` and `stable`. In addition to sql models, the
`internal` and `stable` directories will each have a properties yaml
file (the contents of which is discussed [here](https://docs.getdbt.com/reference/model-properties)),
following the naming scheme
`_[study_name]_[internal/stable]__models.yml`.

The models written in the `stable` directory take a standardized form such
that the tables generated by stable models are identical in structure
between studies. There may be stable models for participants, specimens,
diagnoses, etc. The models written in the `internal` directory are for
non-trivial transformations or data curation that would otherwise add
unnecessary complication to stable models. As such, while every study will
have stable models, not every study will have internal models. Needing
internal models depends on the complexity of source data.

The `aggregation_layer` serves as the unifying layer for multiple studies
within a program (At this time Kids First and INCLUDE). Inside of the
`aggregation_layer` directory will be two directories, `access` and `export`,
each with sql models and a properties yaml file following the naming scheme
`[access/export]__models.yml`. Access models will not contain transformation of
data and will only contain select and join statements from the appropriate
stable model within each study. Models in the `export` directory will
contain sql models that select from and transform access models. These export
models are for creating datasets for specific users or use cases, such as
transforming data in access models into a format that can be ingested into
a FHIR server.
