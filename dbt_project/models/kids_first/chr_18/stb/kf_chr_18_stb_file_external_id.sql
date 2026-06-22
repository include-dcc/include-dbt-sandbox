{{ config(materialized='table') }}

    select
    null::text as "file_file_id",
    null::text as "external_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    