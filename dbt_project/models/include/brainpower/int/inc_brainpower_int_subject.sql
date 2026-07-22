{{ config(materialized='table') }}

with base as (
select
  --null::text as subject_descriptor,
  -- null::text as subject_id,
  null::text as subject_type,
  null::text as organism_type,
  null::text as access_policy_id,
 -- null::text as study_descriptor,
  null::text as external_id
from {{ ref('inc_brainpower_src_inc_kf_access_enums_20260508') }} as d
where enumeration_code = 'participant'
)

select *,
{{ normalize_descriptors(descriptor_cols=['subject_descriptor']) }}::text as subject_descriptor,
{{ normalize_descriptors(descriptor_cols=['study_descriptor']) }}::text as study_descriptor
from base
    