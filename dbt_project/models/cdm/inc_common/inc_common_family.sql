{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  family_id::text as family_id,
  family_type::text as family_type,
  family_description::text as family_description,
  consanguinity::text as consanguinity,
  family_study_focus::text as family_study_focus,
  access_policy_id::text as access_policy_id,
  study_id::integer as study_id
from {{ program_ref }}    