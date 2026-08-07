{{ config(materialized='table') }}

    select
    ncpifile_file_global_id::text as "NCPIFile_file_global_id",
    external_id::text as "external_id"
    from {{ ref('access_ncpifile_external_id') }}
    