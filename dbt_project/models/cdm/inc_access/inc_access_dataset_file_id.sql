{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  dataset_dataset_id::text as dataset_dataset_id,
  file_id_file_id::text as file_id_file_id
    from {{ program_ref }}    