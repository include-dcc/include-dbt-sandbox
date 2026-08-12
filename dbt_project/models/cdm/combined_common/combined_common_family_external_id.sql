{{ config(materialized='table') }}

    select
    null::text as "family_family_id",
    null::text as "external_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    