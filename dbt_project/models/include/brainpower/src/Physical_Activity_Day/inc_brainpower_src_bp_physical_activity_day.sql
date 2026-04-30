{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "days"::integer as "days",
    "weekday"::text as "weekday",
    "season"::text as "season",
    "counts"::integer as "counts",
    "vmc"::integer as "vmc",
    "steps"::integer as "steps",
    "wear_time"::integer as "wear_time",
    "sedentary"::integer as "sedentary",
    "light"::integer as "light",
    "moderate"::integer as "moderate",
    "vigorous"::integer as "vigorous",
    "mvpa"::integer as "mvpa"
    from {{ source('brainpower', 'bp_physical_activity_day') }}
    