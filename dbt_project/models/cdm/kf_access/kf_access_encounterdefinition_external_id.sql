{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    encounterdefinition_encounter_definition_id::text as "encounterdefinition_encounter_definition_id",
    external_id::text as "external_id"
    from {{ program_ref }}
    