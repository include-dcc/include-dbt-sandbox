{{ config(materialized='table') }}

    select
    ncpifile_file_global_id::text as "NCPIFile_file_global_id",
    file_meta_data_id_file_meta_data_id::text as "file_meta_data_id_file_meta_data_id"
    from {{ ref('access_ncpifile_file_meta_data_id') }}
    