{{ config(materialized='table') }}

    select
    assay_assay_id::text as "assay_assay_id",
    sample_id_sample_id::integer as "sample_id_sample_id"
    from {{ ref('combined_assay_sample_id') }}
    