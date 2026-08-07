{{ config(materialized='table') }}

    select
    researchstudy_research_study_id::text as "ResearchStudy_research_study_id",
    study_focus::text as "study_focus"
    from {{ ref('access_researchstudy_study_focus') }}
    