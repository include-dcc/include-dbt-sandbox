{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  doi_do_id::text as doi_do_id,
  external_id::text as external_id
    from {{ program_ref }}    