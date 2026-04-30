{{ config(materialized='table') }}

    select
    accesspolicy_access_policy_id::text as "AccessPolicy_access_policy_id",
    access_policy_code::text as "access_policy_code"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    