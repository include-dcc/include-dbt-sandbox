{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  encounter_id::text as encounter_id,
  subject_id::text as subject_id,
  encounter_definition_id::text as encounter_definition_id,
  age_at_event::integer as age_at_event,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id
    from {{ program_ref }}    