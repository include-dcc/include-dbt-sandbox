{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    study_design::text as "study_design"
    from {{ ref('combined_study_study_design') }}
    