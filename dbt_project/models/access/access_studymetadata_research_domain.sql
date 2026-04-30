{{ config(materialized='table') }}

    select
    studymetadata_study_id::text as "studymetadata_study_id",
    research_domain::text as "research_domain"
    from {{ ref('combined_studymetadata_research_domain') }}
    