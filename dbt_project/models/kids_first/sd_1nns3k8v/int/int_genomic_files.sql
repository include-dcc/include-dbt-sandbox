{{ config(
    schema='int'
) }}

select distinct 
    kf_id as genomic_file_id,
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

    -- is sdc relevant here?
    -- _sdc_batched_at,
    -- _sdc_extracted_at,
    -- _sdc_deleted_at,
    -- _sdc_received_at,
    -- _sdc_table_version,
    -- _sdc_sequence,
    -- _sdc_source_file,
    -- _sdc_source_lineno,
    -- _sdc_sync_started_at,

from {{ ref('src_genomic_files') }}