{{ config(materialized='table') }}

    select
    ncpifile_file_global_id::text as "NCPIFile_file_global_id",
    file_location_id_file_location_id::text as "file_location_id_file_location_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    