{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "familyrelationship_family_relationship_id",
    null::text as "external_id"
    from {{ program_ref }}    