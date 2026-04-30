{{ config(materialized='table') }}

    select
    sample_sample_id::text as "sample_sample_id",
    external_id::text as "external_id"
    from {{ ref('combined_sample_external_id') }}
    