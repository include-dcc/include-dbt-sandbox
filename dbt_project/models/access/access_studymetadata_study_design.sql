{{ config(materialized='table') }}

    select
    studymetadata_study_id::text as "studymetadata_study_id",
    study_design::text as "study_design"
    from {{ ref('combined_studymetadata_study_design') }}
    