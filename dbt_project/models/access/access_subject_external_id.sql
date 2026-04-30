{{ config(materialized='table') }}

    select
    subject_subject_id::text as "subject_subject_id",
    external_id::text as "external_id"
    from {{ ref('combined_subject_external_id') }}
    