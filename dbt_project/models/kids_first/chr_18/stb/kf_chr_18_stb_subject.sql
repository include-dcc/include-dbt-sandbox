{{ config(materialized='table') }}

    select
    null::text as "subject_id",
    null::text as "subject_type",
    null::text as "organism_type",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    