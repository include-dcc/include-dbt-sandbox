{{ config(
    schema='int'
) }}

select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id, 
  kf_id,
  age_at_event_days,
  sample_event_key,
  tissue_type,
  sample_type,
  anatomical_location,
  volume_ul,
  method_of_sample_procurement,
  preservation_method,
  participant_id,
  external_collection_id,
  has_matched_normal_sample,
  amount,
  amount_units,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_src_sample') }}