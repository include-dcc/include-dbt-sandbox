{{ config(materialized='table') }}

    select
    family_global_id::text as "family_global_id",
    family_id::text as "family_id",
    family_type::text as "family_type",
    description::text as "description",
    consanguinity::text as "consanguinity",
    family_focus::text as "family_focus",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    