{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as aliquot_id,
  null::integer as sample_id,
  null::text as availablity_status,
  null::text as quantity_number,
  null::text as quantity_unit,
  null::text as concentration_number,
  null::text as concentration_unit,
  null::text as access_policy_id,
  null::integer as study_id
from {{ program_ref }}    