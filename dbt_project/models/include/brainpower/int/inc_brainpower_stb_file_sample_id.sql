{{ config(materialized='table') }}

    select
    null::text as "file_file_id",
    null::text as "sample_id_sample_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    