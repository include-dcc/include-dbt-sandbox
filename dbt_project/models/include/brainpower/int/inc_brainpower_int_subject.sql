{{ config(materialized='table') }}

select
  {{ normalize_descriptors(descriptor_cols=[d.id]) }}::text as subject_descriptor,
  -- null::text as subject_id,
  null::text as subject_type,
  null::text as organism_type,
  null::text as access_policy_id,
  {{ normalize_descriptors(descriptor_cols=[d.id]) }}::text as study_descriptor,
  null::text as external_id
from {{ ref('inc_brainpower_src_bp_demographics') }} as d

-- from {{ ref('inc_brainpower_src_inc_kf_access_enums_20260508') }}
-- where enumeration_code = 'participant'
    
    