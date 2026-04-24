{{ config(materialized='table') }}

    select
    family_relationship_id::text as "family_relationship_id",
    family_member_id::text as "family_member_id",
    relationship::text as "relationship",
    subject_id::text as "subject_id",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id"
    from {{ ref('combined_familyrelationship') }}
    