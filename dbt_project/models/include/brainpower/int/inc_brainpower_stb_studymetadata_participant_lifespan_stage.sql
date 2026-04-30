{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "participant_lifespan_stage"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    