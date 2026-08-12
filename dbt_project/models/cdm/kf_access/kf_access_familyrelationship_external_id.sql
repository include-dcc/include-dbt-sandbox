{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    familyrelationship_family_relationship_id::text as "familyrelationship_family_relationship_id",
    external_id::text as "external_id"
    from {{ program_ref }}
    