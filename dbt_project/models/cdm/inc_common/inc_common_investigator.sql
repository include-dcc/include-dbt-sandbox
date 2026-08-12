{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  id::integer as id,
  name::text as name,
  institution::text as institution,
  investigator_title::text as investigator_title,
  email::text as email,
  access_policy_id::text as access_policy_id,
  study_id::integer as study_id
from {{ program_ref }}    