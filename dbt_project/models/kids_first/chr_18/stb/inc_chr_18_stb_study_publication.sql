{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::integer as "publication_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    