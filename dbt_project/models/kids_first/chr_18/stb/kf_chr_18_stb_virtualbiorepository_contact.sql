{{ config(materialized='table') }}

    select
    null::text as "virtualbiorepository_vbr_id",
    null::integer as "contact_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    