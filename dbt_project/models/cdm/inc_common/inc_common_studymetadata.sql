{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as study_id,
  null::text as selection_criteria,
  null::integer as vbr_id,
  null::integer as expected_number_of_participants,
  null::integer as actual_number_of_participants,
  null::text as access_policy_id
from {{ program_ref }}    