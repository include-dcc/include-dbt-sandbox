{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::integer as "contact_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    