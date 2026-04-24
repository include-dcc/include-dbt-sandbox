{{ config(materialized='table') }}

    select
    sample_id::text as "sample_id",
    biospecimen_collection_id::text as "biospecimen_collection_id",
    parent_sample_id::text as "parent_sample_id",
    sample_type::text as "sample_type",
    availablity_status::text as "availablity_status",
    quantity_number::text as "quantity_number",
    quantity_unit::text as "quantity_unit",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id"
    from {{ ref('combined_sample') }}
    