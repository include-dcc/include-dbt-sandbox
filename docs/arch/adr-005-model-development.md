---
# These are optional metadata elements. Feel free to remove any of them.
status: "proposed"
date: 2025-12-01
---

# dbt Model Deployment in Airflow

## Context

There needs to be a decision regarding the development lifecycle of dbt models.

## Decision

The steps of the development lifecycle are described below:

1. New study comes in and sources are loaded into the warehouse
2. Developer(s) are assigned to harmonize the study into the warehouse.
3. A new directory for the study in the appropriate program directory is created
4. In the root of this directory is a `sources.yml` file making the source
    tables loaded in step 1 accessible to dbt.
5. in the `internal` directory of the study's directory, models are written that
    harmonize the source data. There may be an arbitrary number of structural
    and semantic harmonization steps performed in the internal data stage as
    required, depending on the complexity of transformations required by the
    source data
6. models extracting from the result of `internal` models are written in the
    `stable` directory.
7. the dbt models for the study are run and tested by the developer(s) writing
    the models.
8. Changes are pushed to github, a pull request is created and reviewed.
9. After review is completed and the pull request is approved by reviewers, the
    pull request is merged.
