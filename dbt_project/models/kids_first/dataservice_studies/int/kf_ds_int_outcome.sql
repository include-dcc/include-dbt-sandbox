{{ config(
    schema='int'
) }}

select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id, -- i think we can leave this out - it's rarely populated/used, 
  vital_status,
  disease_related,
  age_at_event_days,
  participant_id,
  kf_id,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_src_outcome') }}