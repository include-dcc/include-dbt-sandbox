{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "sample_id",
    null::text as "biospecimen_collection_id",
    null::integer as "parent_sample_id",
    null::text as "sample_type",
    null::text as "availablity_status",
    null::text as "quantity_number",
    null::text as "quantity_unit",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    