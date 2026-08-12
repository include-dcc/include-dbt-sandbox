{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as id,
  null::text as name,
  null::text as institution,
  null::text as investigator_title,
  null::text as email,
  null::text as access_policy_id,
  null::integer as study_id
from {{ program_ref }}    