{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as id,
  null::text as hash_type,
  null::text as hash_value
from {{ program_ref }}    