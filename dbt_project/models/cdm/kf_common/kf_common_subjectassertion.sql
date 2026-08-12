{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    assertion_id::text as "assertion_id",
    subject_id::integer as "subject_id",
    encounter_id::text as "encounter_id",
    assertion_provenance::text as "assertion_provenance",
    age_at_assertion::integer as "age_at_assertion",
    age_at_event::integer as "age_at_event",
    age_at_resolution::integer as "age_at_resolution",
    concept_source::text as "concept_source",
    value_number::text as "value_number",
    value_source::text as "value_source",
    value_unit::text as "value_unit",
    value_unit_source::text as "value_unit_source",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    