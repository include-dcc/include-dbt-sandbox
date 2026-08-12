{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  family_relationship_id::text as family_relationship_id,
  family_member_id::text as family_member_id,
  relationship::text as relation,
  subject_id::text as subject_id,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id
from {{ program_ref }}