{{ config(
    schema='stable'
) }}

select distinct 
  genomic_file_id,
  created_at, 
  modified_at, 
  external_id,
  is_harmonized,
  reference_genome,
  controlled_access,
  availability,
  paired_end,
  visible,
  visibility_reason,
  visibility_comment,
  data_type, 
  file_format,
  data_category,
  workflow_tool,
  workflow_type,
  workflow_version,
  workflow_endpoint,
  file_version_descriptor,
  cavatica_volume

from {{ ref('int_genomic_files') }}