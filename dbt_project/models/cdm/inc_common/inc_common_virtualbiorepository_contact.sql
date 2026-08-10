{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::integer as "virtualbiorepository_vbr_id",
    null::integer as "contact_id"
    from {{ program_ref }}    