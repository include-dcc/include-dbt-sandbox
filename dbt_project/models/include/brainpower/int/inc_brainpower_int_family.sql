{{ config(materialized='table') }}

with base as (
  select
    null::text as f_id,
    null::text as family_type,
    null::text as family_description,
    null::text as consanguinity,
    null::text as family_study_focus,
    null::text as ap_id,
    null::integer as st_id
)

select distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['f_id']) }}::text as family_descriptor,
  {{ normalize_descriptors(descriptor_cols=['ap_id']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['st_id']) }}::text as study_descriptor
from base

where 1 = 0
    