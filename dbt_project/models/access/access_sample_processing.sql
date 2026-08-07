{{ config(materialized='table') }}

    select
    sample_sample_id::integer as "sample_sample_id",
    processing::text as "processing"
    from {{ ref('combined_sample_processing') }}
    