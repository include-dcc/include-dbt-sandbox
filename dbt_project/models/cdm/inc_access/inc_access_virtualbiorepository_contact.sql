{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  virtualbiorepository_vbr_id::text as virtualbiorepository_vbr_id,
  contact_id::integer as contact_id
    from {{ program_ref }}    