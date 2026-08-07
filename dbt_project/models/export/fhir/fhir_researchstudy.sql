{{ config(materialized='table') }}

    select
    research_study_id::text as "research_study_id",
    study_title::text as "study_title",
    parent_study_id::text as "parent_study_id",
    description::text as "description",
    study_status::text as "study_status",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_researchstudy') }}
    