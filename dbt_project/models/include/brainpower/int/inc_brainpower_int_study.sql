{{ config(materialized='table') }}

with base as (
select
  null::text as parent_study,
  study_title::text as study_title,
  -- study_code::text as study_code,
  null::text as study_short_name,
  study_description::text as study_description,
  study_website::text as website,
  acknowledgments::text as acknowledgments, -- empty for BrainPower
  citation_statement::text as citation_statement, -- empty for BrainPower
  null::text as do_id
  -- null::text as access_policy_id,
  -- null::text as study_id
from {{ ref('inc_brainpower_src_study') }}
)

select
distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}
  