{{ config(materialized='table') }}

with base as(
select
  -- null::text as study_id,
  null::text as selection_criteria,
  null::text as vbr_id,
  s.expected_number_of_participants::integer as expected_number_of_participants,
  null::integer as actual_number_of_participants -- not in a table to join to
  -- null::text as access_policy_id
from {{ ref('inc_brainpower_src_study') }} as s
)

select
distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}
