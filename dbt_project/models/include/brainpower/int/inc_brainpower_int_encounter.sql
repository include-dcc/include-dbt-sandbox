{{ config(materialized='table') }}

with base as (
  select
  -- null::text as encounter_id,
    null::text as subject_id,
    null::text as encounter_definition_id,
    age_at_visit::integer as age_at_event,
    null::text as access_policy_id,
    null::text as study_id,
    timepoint::text as encounter_external_id,
    id::text as subject_external_id
  from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
)

select distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['subject_external_id']) }}::text as subject_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor,
  {{ normalize_descriptors(descriptor_cols=['subject_external_id', 'encounter_external_id']) }}::text as encounter_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}
