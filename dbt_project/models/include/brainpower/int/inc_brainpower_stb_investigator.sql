{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "name",
    null::text as "institution",
    null::text as "investigator_title",
    null::text as "email",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    