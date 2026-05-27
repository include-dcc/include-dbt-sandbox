{{ config(materialized='table') }}

    select
    null::text as "access_policy_id",
    null::text as "data_use_accession",
    null::text as "data_use_permission",
    null::text as "data_use_modifier",
    null::text as "disease_limitation",
    null::text as "access_description",
    null::text as "website"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    