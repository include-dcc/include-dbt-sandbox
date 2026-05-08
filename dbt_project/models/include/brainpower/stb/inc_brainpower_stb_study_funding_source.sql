{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "funding_source"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    