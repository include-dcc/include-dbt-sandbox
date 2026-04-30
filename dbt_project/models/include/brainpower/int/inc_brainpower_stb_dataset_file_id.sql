{{ config(materialized='table') }}

    select
    null::text as "dataset_dataset_id",
    null::text as "file_id_file_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    