{{ config(materialized='table') }}

    select
    practitioner_id::text as "practitioner_id",
    name::text as "name",
    email::text as "email",
    institution_id::text as "institution_id",
    practitioner_role_id::text as "practitioner_role_id",
    description::text as "description",
    practitioner_title::text as "practitioner_title",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    