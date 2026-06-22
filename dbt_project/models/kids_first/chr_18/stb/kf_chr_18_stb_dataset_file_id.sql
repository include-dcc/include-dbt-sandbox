{{ config(materialized='table') }}

    select
    null::text as "dataset_dataset_id",
    null::text as "file_id_file_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    