{{ config(materialized='table') }}

    select
    null::text as "file_file_id",
    null::text as "subject_id_subject_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    