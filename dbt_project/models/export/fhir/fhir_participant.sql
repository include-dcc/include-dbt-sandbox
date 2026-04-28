{{ config(materialized='table') }}

    select
    participant_id::text as "participant_id",
    birthsex::text as "birthsex",
    ethnicity::text as "ethnicity",
    population::text as "population",
    dob::text as "dob",
    dob_method::text as "dob_method",
    age_at_last_vital::text as "age_at_last_vital",
    is_deceased::text as "is_deceased",
    deceased_rel::text as "deceased_rel",
    patient_knowledge_source::text as "patient_knowledge_source",
    family_global_id::text as "family_global_id",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    
    