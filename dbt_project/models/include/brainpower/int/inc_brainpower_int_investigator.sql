{{ config(materialized='table') }}

with base as (
  select
    null::integer as id,
    string_to_table(s.principal_investigator_name, '|')::text as name,
    s.study_contact_institution::text as institution,
    null::text as investigator_title,
    s.study_contact_email::text as email
  -- null::text as access_policy_id,
  -- null::text as study_id
  from {{ ref('inc_brainpower_src_study') }} as s
)

select distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}
  
