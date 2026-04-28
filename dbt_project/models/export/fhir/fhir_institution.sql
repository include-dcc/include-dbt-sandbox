{{ config(materialized='table') }}

    select
    institution_id::text as "institution_id",
    name::text as "name",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    