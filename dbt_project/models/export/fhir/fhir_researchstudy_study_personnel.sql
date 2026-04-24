{{ config(materialized='table') }}

    select
    researchstudy_research_study_id::text as "ResearchStudy_research_study_id",
    study_personnel_id::text as "study_personnel_id"
    from {{ ref('access_researchstudy_study_personnel') }}
    