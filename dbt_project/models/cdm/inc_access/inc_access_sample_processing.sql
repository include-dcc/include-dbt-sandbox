{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  sample_sample_id::text as sample_sample_id,
  processing::text as processing
    from {{ program_ref }}    