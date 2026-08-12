{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  study_study_id::integer as study_study_id,
  program::text as program
from {{ program_ref }}    