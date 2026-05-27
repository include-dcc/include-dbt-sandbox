{{ config(materialized='table') }}

    select
    null::text as "do_id",
    null::text as "bibliographic_reference",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    