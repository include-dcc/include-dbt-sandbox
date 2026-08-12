{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as encounter_id,
  null::integer as subject_id,
  null::text as encounter_definition_id,
  null::integer as age_at_event,
  null::text as access_policy_id,
  null::integer as study_id
from {{ program_ref }}    