{{ config(materialized='table') }}

    select
    filemetadata_file_meta_data_id::text as "FileMetaData_file_meta_data_id",
    samples_sample_id::text as "samples_sample_id"
    from {{ ref('access_filemetadata_samples') }}
    