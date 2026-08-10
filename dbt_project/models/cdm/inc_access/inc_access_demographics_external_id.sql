{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  demographics_subject_id::text as demographics_subject_id,
  external_id::text as external_id
    from {{ program_ref }}    