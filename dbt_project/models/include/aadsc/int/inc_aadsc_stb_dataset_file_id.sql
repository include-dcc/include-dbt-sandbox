{{ config(materialized='table') }}

    select
    null::text as "dataset_dataset_id",
    null::text as "file_id_file_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    