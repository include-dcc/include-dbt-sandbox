{{ config(materialized='table') }}

    select
    id::integer as "id",
    hash_type::text as "hash_type",
    hash_value::text as "hash_value"
    from {{ ref('combined_filehash') }}
    