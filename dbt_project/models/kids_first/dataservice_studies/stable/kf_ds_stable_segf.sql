{{ config(
    schema='stable'
) }}

select distinct
  created_at,
  modified_at,
  uuid, -- we can leave this out, it's not used
  visible,
  sequencing_experiment_id, 
  genomic_file_id,
  external_id, -- this is rarely populated, it could be left out
  segf_id,
  visibility_reason,
  visibility_comment 
from {{ ref('kf_ds_int_segf') }}