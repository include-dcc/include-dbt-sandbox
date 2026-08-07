{{ config(materialized='table') }}

    select
    null::integer as "study_study_id",
    null::text as "program"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    