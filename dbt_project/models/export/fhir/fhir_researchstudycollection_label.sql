{{ config(materialized='table') }}

    select
    researchstudycollection_research_study_collection_id::text as "ResearchStudyCollection_research_study_collection_id",
    label::text as "label"
    from {{ ref('access_researchstudycollection_label') }}
    