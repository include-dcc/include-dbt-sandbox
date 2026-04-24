{{ config(materialized='table') }}

    select
    dataset_dataset_id::text as "dataset_dataset_id",
    file_id_file_id::text as "file_id_file_id"
    from {{ ref('combined_dataset_file_id') }}
    