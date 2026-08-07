{{ config(materialized='table') }}

    select
    assay_assay_id::text as "assay_assay_id",
    subject_id_subject_id::integer as "subject_id_subject_id"
    from {{ ref('combined_assay_subject_id') }}
    