{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  studymetadata_study_id::integer as studymetadata_study_id,
  study_design::text as study_design
from {{ program_ref }}    