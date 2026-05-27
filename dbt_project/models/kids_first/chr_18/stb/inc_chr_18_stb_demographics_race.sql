{{ config(materialized='table') }}

    select
    null::text as "demographics_subject_id",
    null::text as "race"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    