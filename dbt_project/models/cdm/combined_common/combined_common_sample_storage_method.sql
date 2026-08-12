{{ config(materialized='table') }}

    select
    null::integer as "sample_sample_id",
    null::text as "storage_method"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    