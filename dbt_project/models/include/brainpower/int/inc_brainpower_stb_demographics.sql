{{ config(materialized='table') }}

    select
    null::text as "subject_id",
    null::text as "sex",
    null::text as "ethnicity",
    null::text as "down_syndrome_status",
    null::integer as "age_at_last_vital_status",
    null::text as "vital_status",
    null::integer as "age_at_first_engagement",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    