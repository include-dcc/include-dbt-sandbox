{{ config(materialized='table') }}

    select
    researchstudy_research_study_id::text as "ResearchStudy_research_study_id",
    study_condition::text as "study_condition"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    