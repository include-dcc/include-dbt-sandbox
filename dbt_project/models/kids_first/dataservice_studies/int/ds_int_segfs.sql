{{ config(
    schema='int'
) }}

select distinct
  created_at,
  modified_at,
  uuid, -- we can leave this out, it's not used
  visible,
  sequencing_experiment_id, 
  genomic_file_id,
  external_id, -- this is rarely populated, it could be left out
  kf_id as segf_id,
  visibility_reason,
  visibility_comment 
from {{ ref ('src_segf') }}