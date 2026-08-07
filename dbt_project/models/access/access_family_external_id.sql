{{ config(materialized='table') }}

    select
    family_family_id::text as "family_family_id",
    external_id::text as "external_id"
    from {{ ref('combined_family_external_id') }}
    