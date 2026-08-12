{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  file_file_id::text as file_file_id,
  hash_id::integer as hash_id
from {{ program_ref }}    