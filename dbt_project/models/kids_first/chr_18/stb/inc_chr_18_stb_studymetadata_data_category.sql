{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "data_category"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    