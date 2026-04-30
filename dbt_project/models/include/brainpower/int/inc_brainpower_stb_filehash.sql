{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "hash_type",
    null::text as "hash_value"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    