{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "research_domain"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    