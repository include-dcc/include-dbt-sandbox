{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "height"::float as "height",
    "weight"::float as "weight",
    "bmi"::float as "bmi",
    "waist"::float as "waist",
    "sbp"::float as "sbp",
    "dbp"::float as "dbp",
    "resting_hr"::float as "resting_hr"
    from {{ source('brainpower', 'bp_anthropometrics') }}
    