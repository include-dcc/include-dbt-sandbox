{{ config(materialized='table') }}

    select
    assay_assay_id::text as "assay_assay_id",
    external_id::text as "external_id"
    from {{ ref('combined_assay_external_id') }}
    