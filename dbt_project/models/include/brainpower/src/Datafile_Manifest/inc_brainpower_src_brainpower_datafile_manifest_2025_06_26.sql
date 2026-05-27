{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "Study Code"::text as "study_code",
    "Participant Global ID"::text as "participant_global_id",
    "Participant External ID"::text as "participant_external_id",
    "Sample Global ID"::text as "sample_global_id",
    "Sample External ID"::text as "sample_external_id",
    "File Name"::text as "file_name",
    "File Global ID"::text as "file_global_id",
    "File Upload Location"::text as "file_upload_location",
    "File S3 Location"::text as "file_s3_location",
    "DRS URI"::text as "drs_uri",
    "File Hash"::text as "file_hash",
    "Data Access"::text as "data_access",
    "Data Category"::text as "data_category",
    "Data Type"::text as "data_type",
    "Experimental Strategy"::text as "experimental_strategy",
    "Experimental Platform"::text as "experimental_platform",
    "File Format"::text as "file_format",
    "File Size"::integer as "file_size",
    "File Size Unit"::text as "file_size_unit"
    from {{ source('brainpower', 'brainpower_datafile_manifest_2025_06_26') }}
    