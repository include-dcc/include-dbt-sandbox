{{ config(materialized='table') }}

    select
    file_file_id::text as "file_file_id",
    sample_id_sample_id::text as "sample_id_sample_id"
    from {{ ref('combined_file_sample_id') }}
    