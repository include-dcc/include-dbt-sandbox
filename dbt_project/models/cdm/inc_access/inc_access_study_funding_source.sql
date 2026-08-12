{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  study_study_id::text as study_study_id,
  funding_source::text as funding_source
from {{ program_ref }}    