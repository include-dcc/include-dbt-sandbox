{{ config(materialized='table') }}

    select
    studymetadata_study_id::text as "studymetadata_study_id",
    participant_lifespan_stage::text as "participant_lifespan_stage"
    from {{ ref('combined_studymetadata_participant_lifespan_stage') }}
    