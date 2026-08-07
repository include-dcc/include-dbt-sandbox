{{ config(materialized='table') }}

    select
    researchstudy_research_study_id::text as "ResearchStudy_research_study_id",
    study_acknowledgement::text as "study_acknowledgement"
    from {{ ref('access_researchstudy_study_acknowledgement') }}
    