{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  study_study_id::text as study_study_id,
  study_design::text as study_design
from {{ program_ref }}    