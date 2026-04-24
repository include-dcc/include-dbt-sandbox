{{ config(materialized='table') }}

    select
    familyrelationship_family_relationship_id::text as "familyrelationship_family_relationship_id",
    external_id::text as "external_id"
    from {{ ref('combined_familyrelationship_external_id') }}
    