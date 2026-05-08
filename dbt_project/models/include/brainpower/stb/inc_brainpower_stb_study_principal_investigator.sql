{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::integer as "principal_investigator_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    