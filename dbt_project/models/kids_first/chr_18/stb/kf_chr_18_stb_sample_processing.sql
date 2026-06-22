{{ config(materialized='table') }}

    select
    null::text as "sample_sample_id",
    null::text as "processing"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    