{{ config(materialized='table') }}

    select
    researchstudycollection_research_study_collection_id::text as "ResearchStudyCollection_research_study_collection_id",
    research_study_collection_member_id_research_study_id::text as "research_study_collection_member_id_research_study_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    