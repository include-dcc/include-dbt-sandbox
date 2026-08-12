{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as study_study_id,
  null::integer as principal_investigator_id
from {{ program_ref }}    