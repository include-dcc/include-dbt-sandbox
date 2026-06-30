{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "data_category"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    