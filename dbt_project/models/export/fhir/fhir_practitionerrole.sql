{{ config(materialized='table') }}

    select
    practitioner_role_id::text as "practitioner_role_id",
    institution_id::text as "institution_id",
    practitioner_id::text as "practitioner_id",
    period_id::text as "period_id"
    from {{ ref('access_practitionerrole') }}
    