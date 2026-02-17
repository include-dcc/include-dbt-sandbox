{{ config(
    schema='stable'
) }}

select distinct 
  uuid, -- we can leave this out; isn't used,
  created_at,
  modified_at, 
  investigator_id, 
  dewrangle_investigator_id,
  external_id, 
  name,
  institution,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_int_investigator') }}