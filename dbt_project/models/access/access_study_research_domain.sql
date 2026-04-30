{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    research_domain::text as "research_domain"
    from {{ ref('combined_study_research_domain') }}
    