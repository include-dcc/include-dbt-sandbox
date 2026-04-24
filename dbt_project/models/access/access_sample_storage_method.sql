{{ config(materialized='table') }}

    select
    sample_sample_id::text as "sample_sample_id",
    storage_method::text as "storage_method"
    from {{ ref('combined_sample_storage_method') }}
    