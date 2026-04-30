{{ config(materialized='table') }}

    select
    null::text as "encounter_id",
    null::text as "subject_id",
    null::text as "encounter_definition_id",
    null::integer as "age_at_event",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    