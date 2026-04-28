{{ config(materialized='table') }}

    select
    family_relationship_id::text as "family_relationship_id",
    patient_id::text as "patient_id",
    relative_id::text as "relative_id",
    relationship::text as "relationship",
    knowledge_source::text as "knowledge_source",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    