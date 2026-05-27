{{ config(materialized='table') }}

    select
    null::text as "virtualbiorepository_vbr_id",
    null::text as "external_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    