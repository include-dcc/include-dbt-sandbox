{{ config(materialized='table') }}

    select
    aliquot_id::text as "aliquot_id",
    sample_id::text as "sample_id",
    availablity_status::text as "availablity_status",
    quantity_number::text as "quantity_number",
    quantity_unit::text as "quantity_unit",
    concentration_number::text as "concentration_number",
    concentration_unit::text as "concentration_unit",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id"
    from {{ ref('combined_aliquot') }}
    