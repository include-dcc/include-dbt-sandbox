{{ config(materialized='table') }}

    select
    null::text as "dataset_dataset_id",
    null::integer as "publication_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    