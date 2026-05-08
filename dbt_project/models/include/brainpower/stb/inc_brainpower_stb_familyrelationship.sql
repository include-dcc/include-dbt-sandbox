{{ config(materialized='table') }}

    select
    null::text as "family_relationship_id",
    null::text as "family_member_id",
    null::text as "relationship",
    null::text as "subject_id",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    