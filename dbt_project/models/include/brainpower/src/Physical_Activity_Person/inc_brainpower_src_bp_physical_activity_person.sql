{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "counts"::float as "counts",
    "vmc"::float as "vmc",
    "steps"::float as "steps",
    "wear_time"::float as "wear_time",
    "sedentary"::float as "sedentary",
    "light"::float as "light",
    "moderate"::float as "moderate",
    "vigorous"::float as "vigorous",
    "mvpa"::float as "mvpa",
    "valid_days"::integer as "valid_days",
    "valid_weekend_days"::integer as "valid_weekend_days"
    from {{ source('brainpower', 'bp_physical_activity_person') }}
    