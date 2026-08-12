{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  study_study_id::text as study_study_id,
  principal_investigator_id::integer as principal_investigator_id
from {{ program_ref }}    