{{ config(materialized='table') }}

    select
    file_file_id::text as "file_file_id",
    external_id::text as "external_id"
    from {{ ref('combined_file_external_id') }}
    