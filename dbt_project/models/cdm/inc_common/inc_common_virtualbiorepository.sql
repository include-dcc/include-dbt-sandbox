{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  vbr_id::text as vbr_id,
  name::text as name,
  institution::text as institution,
  website::text as website,
  vbr_readme::text as vbr_readme,
  access_policy_id::text as access_policy_id,
  study_id::integer as study_id
from {{ program_ref }}    