{{ config(materialized='table') }}

    select
    null::text as "familyrelationship_family_relationship_id",
    null::text as "external_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    