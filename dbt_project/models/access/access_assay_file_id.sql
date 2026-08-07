{{ config(materialized='table') }}

    select
    assay_assay_id::text as "assay_assay_id",
    file_id_file_id::text as "file_id_file_id"
    from {{ ref('combined_assay_file_id') }}
    