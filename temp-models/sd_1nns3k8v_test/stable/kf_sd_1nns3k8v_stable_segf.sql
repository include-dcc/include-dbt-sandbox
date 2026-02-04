{{ config(
    schema='stable'
) }}

select distinct
  created_at,
  modified_at,
  uuid, 
  visible,
  sequencing_experiment_id, 
  genomic_file_id,
  external_id, 
  segf_id,
  visibility_reason,
  visibility_comment 
from {{ ref ('kf_sd_1nns3k8v_int_segf') }}