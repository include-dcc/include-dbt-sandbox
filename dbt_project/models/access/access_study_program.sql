{{ config(materialized='table') }}

    select
    study_study_id::integer as "study_study_id",
    program::text as "program"
    from {{ ref('combined_study_program') }}
    