{{ config(
    schema='stable'
) }}

select distinct 
  uuid, -- we can leave this out; it's not used,
  genomic_file_id,
  dewrangle_genomic_file_id,
  created_at, -- think these could be useful when answering questions about changes over time
  modified_at, -- ^^^
  external_id,
  is_harmonized,
  reference_genome,
  controlled_access, -- would be nice to incorporate mappung logic for this field based on file type, location and harmonization
  availability,
  paired_end,
  visible,
  visibility_reason,
  visibility_comment,

  -- should we discuss with bix about standardizing these values? I know ingest mapping logic has changed over time
  data_type, 
  file_format,
  data_category,
  workflow_tool,
  workflow_type,
  workflow_version,
  workflow_endpoint,
  file_version_descriptor, -- should discuss with bix about reliability of these values in dataservice currently

  -- could be useful after delivery but would be null during source load
  cavatica_file_id, 
  cavatica_volume

from {{ ref('int_genomic_files') }}