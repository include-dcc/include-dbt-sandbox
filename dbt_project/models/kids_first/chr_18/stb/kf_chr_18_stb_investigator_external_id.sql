{{ config(materialized='table') }}

    select
    null::integer as "investigator_id",
    null::text as "external_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    