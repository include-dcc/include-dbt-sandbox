{{ config(
    schema='int'
) }}

-- this entity as a whole may not be needed - a simple "seq center name" may be all that's needed in the seq exp table

select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id,
  kf_id,
  name as sequencing_center_name,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_ds_src_sequencing_center') }}
