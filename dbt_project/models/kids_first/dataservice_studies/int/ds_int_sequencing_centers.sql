{{ config(
    schema='int'
) }}


select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id,
  kf_id,
  name as sequencing_center_name,
  visible,
  visibility_reason,
  visibility_comment,
from {{ ref('src_sequencing_centers') }}