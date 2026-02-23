{{ config(
    schema='stable'
) }}

-- we currently use this table in DS to link specimens/gfs
-- not sure if we would need it here, since we can easily add specimen ids to a files model

select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  genomic_file_id,
  biospecimen_id,
  bsgf_id,
  visible,
  external_id, -- i think we can leave this out - it's rarely populated/used, 
  visibility_reason,
  visibility_comment
from {{ ref('kf_sd_1nns3k8v_int_bsgf') }}