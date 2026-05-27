{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "hash_type",
    null::text as "hash_value"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    