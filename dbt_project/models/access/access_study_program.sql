{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    program::text as "program"
    from {{ ref('combined_study_program') }}
    