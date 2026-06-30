{{ config(materialized='table') }}

    select
    null::text as "aliquot_id",
    sample_id as "sample_id",
    null::text as "availablity_status",
    null::text as "quantity_number",
    null::text as "quantity_unit",
    null::text as "concentration_number",
    null::text as "concentration_unit",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_int_sequencing') }}
    