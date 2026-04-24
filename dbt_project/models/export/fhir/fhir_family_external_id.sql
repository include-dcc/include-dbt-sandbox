{{ config(materialized='table') }}

    select
    family_family_global_id::text as "Family_family_global_id",
    external_id::text as "external_id"
    from {{ ref('access_family_external_id') }}
    