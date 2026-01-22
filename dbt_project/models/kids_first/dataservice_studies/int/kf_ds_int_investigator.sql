{{ config(
    schema='int'
) }}

select distinct 
  uuid, -- we can leave this out; isn't used,
  created_at,
  modified_at, 
  kf_id as investigator_id, 
  lower(replace(kf_id, '_', '-')) as dewrangle_investigator_id,
  external_id, 
  name,
  institution,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_src_investigator') }}