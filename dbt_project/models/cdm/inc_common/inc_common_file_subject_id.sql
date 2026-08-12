{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  file_file_id::text as file_file_id,
  subject_id_subject_id::integer as subject_id_subject_id
from {{ program_ref }}    