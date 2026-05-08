{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "bibliographic_reference",
    null::text as "website",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    