{{ config(materialized='table') }}

    select
    study_membership_id::text as "study_membership_id",
    access_policy_id::text as "access_policy_id",
    research_study_id::text as "research_study_id"
    from {{ ref('access_studymembership') }}
    