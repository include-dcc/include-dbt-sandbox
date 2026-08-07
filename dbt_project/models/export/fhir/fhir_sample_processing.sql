{{ config(materialized='table') }}

    select
    sample_sample_id::text as "Sample_sample_id",
    processing::text as "processing"
    from {{ ref('access_sample_processing') }}
    