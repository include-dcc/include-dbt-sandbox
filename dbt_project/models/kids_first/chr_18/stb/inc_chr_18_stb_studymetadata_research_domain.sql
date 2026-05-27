{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "research_domain"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    