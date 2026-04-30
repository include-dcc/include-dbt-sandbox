{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "cohort"::integer as "cohort",
    "strata"::integer as "strata",
    "randomization"::integer as "randomization"
    from {{ source('brainpower', 'bp_randomization') }}
    