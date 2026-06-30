{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "clinical_data_source_type"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    