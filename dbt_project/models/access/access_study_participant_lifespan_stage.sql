{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    participant_lifespan_stage::text as "participant_lifespan_stage"
    from {{ ref('combined_study_participant_lifespan_stage') }}
    