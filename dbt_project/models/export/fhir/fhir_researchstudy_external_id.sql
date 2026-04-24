{{ config(materialized='table') }}

    select
    researchstudy_research_study_id::text as "ResearchStudy_research_study_id",
    external_id::text as "external_id"
    from {{ ref('access_researchstudy_external_id') }}
    