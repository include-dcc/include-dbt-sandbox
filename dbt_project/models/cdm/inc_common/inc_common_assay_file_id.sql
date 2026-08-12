{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as assay_assay_id,
  null::text as file_id_file_id
from {{ program_ref }}    