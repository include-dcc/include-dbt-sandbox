{{ config(materialized='table') }}

    select
    file_file_id::text as "file_file_id",
    hash_id::integer as "hash_id"
    from {{ ref('combined_file_hash') }}
    