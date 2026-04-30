{{ config(materialized='table') }}

    select
    access_policy_id::text as "access_policy_id",
    description::text as "description",
    data_access_type::text as "data_access_type",
    website::text as "website",
    consent_scope::text as "consent_scope",
    disease_limitation::text as "disease_limitation",
    status::text as "status"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    