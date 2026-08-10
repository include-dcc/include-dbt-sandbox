{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "assertion_id",
    null::integer as "subject_id",
    null::text as "encounter_id",
    null::text as "assertion_provenance",
    null::integer as "age_at_assertion",
    null::integer as "age_at_event",
    null::integer as "age_at_resolution",
    null::text as "concept_source",
    null::text as "value_number",
    null::text as "value_source",
    null::text as "value_unit",
    null::text as "value_unit_source",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    