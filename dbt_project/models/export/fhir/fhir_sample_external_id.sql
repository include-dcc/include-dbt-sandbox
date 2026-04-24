{{ config(materialized='table') }}

    select
    sample_sample_id::text as "Sample_sample_id",
    external_id::text as "external_id"
    from {{ ref('access_sample_external_id') }}
    