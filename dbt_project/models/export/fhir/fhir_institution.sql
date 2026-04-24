{{ config(materialized='table') }}

    select
    institution_id::text as "institution_id",
    name::text as "name",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_institution') }}
    