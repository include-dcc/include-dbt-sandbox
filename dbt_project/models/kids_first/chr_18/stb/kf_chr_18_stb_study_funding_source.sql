{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "funding_source"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    