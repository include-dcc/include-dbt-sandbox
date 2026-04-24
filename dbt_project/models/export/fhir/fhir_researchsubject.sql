{{ config(materialized='table') }}

    select
    research_subject_id::text as "research_subject_id",
    participant_id::text as "participant_id",
    study_membership_id::text as "study_membership_id",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_researchsubject') }}
    