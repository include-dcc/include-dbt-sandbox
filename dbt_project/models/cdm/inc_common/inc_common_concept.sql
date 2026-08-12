{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as concept_curie,
  null::text as display
from {{ program_ref }}    