{{ config(materialized='table') }}

with base as (
  select
    d.id,
    -- null::text as subject_id,
    null::text as subject_type,
    null::text as organism_type
    -- null::text as access_policy_id,
    -- null::text as study_id,
  from (select id from {{ ref('inc_brainpower_src_bp_demographics') }}) as d
)


select 
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['id']) }}::text as subject_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}
    