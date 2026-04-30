{{ config(materialized='table') }}

    select
    null::text as "demographics_subject_id",
    null::text as "race"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    