{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "age_at_visit"::integer as "age_at_visit",
    "age_cog"::integer as "age_cog",
    "age_mri"::integer as "age_mri",
    "visit_latency"::integer as "visit_latency",
    "cog_latency"::integer as "cog_latency",
    "mri_latency"::integer as "mri_latency"
    from {{ source('brainpower', 'bp_age_event_latency') }}
    