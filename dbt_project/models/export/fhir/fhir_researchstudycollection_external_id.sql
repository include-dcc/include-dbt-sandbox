{{ config(materialized='table') }}

    select
    researchstudycollection_research_study_collection_id::text as "ResearchStudyCollection_research_study_collection_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF

    