{{ config(materialized='table') }}

    select
    researchstudycollection_research_study_collection_id::text as "ResearchStudyCollection_research_study_collection_id",
    label::text as "label"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    