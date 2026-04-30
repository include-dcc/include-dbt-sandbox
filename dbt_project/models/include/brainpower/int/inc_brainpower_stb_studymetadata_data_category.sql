{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "data_category"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    