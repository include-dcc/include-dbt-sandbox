{{ config(materialized='table') }}

    select
    null::text as "dataset_dataset_id",
    null::integer as "publication_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    