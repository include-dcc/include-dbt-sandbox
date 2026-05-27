{{ config(materialized='table') }}

    select
    null::text as "aliquot_id",
    null::text as "sample_id",
    null::text as "availablity_status",
    null::text as "quantity_number",
    null::text as "quantity_unit",
    null::text as "concentration_number",
    null::text as "concentration_unit",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    