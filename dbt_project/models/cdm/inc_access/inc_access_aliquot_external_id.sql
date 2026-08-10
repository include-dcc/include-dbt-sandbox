{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  aliquot_aliquot_id::text as aliquot_aliquot_id,
  external_id::text as external_id
    from {{ program_ref }}    