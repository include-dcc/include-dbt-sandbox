{{ config(materialized='table') }}

    select
    name::text as "name",
    role::text as "role",
    associated_party_practitioner_id::text as "associated_party_practitioner_id",
    associated_party_practitioner_role_id::text as "associated_party_practitioner_role_id",
    associated_party_institution_id::text as "associated_party_institution_id",
    id::text as "id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    