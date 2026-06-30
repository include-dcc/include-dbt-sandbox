{{ config(materialized='table') }}

    select
    null::text as "concept_curie",
    null::text as "display"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    