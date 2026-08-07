{{ config(materialized='table') }}

    select
    file_file_id::text as "file_file_id",
    subject_id_subject_id::integer as "subject_id_subject_id"
    from {{ ref('combined_file_subject_id') }}
    