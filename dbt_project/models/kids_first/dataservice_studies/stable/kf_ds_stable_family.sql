{{ config(
    schema='stable'
) }}

select distinct 
  uuid, -- we can leave this out; isn't used,
  created_at,
  modified_at, 
  family_id, 
  dewrangle_family_id,
  external_id, 
  family_type, -- not historically populated but it should be; can use logic rules to calculate
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_int_family') }}