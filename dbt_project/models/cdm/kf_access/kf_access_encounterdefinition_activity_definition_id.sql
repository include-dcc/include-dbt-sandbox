{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    encounterdefinition_encounter_definition_id::text as "encounterdefinition_encounter_definition_id",
    activity_definition_id_activity_definition_id::text as "activity_definition_id_activity_definition_id"
    from {{ program_ref }}
    