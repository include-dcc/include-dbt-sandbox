{{ config(materialized='table') }}

    select
    null::text as "assay_assay_id",
    null::integer as "subject_id_subject_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    