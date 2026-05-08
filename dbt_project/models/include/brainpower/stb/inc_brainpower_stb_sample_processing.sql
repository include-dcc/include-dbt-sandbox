{{ config(materialized='table') }}

    select
    null::text as "sample_sample_id",
    null::text as "processing"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    