{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "clinical_data_source_type"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    