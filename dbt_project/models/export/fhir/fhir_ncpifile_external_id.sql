{{ config(materialized='table') }}

    select
    ncpifile_file_global_id::text as "NCPIFile_file_global_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    