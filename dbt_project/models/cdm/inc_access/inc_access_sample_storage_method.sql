{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  sample_sample_id::text as sample_sample_id,
  storage_method::text as storage_method
from {{ program_ref }}    