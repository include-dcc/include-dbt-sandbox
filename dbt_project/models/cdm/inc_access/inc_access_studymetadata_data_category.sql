{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  studymetadata_study_id::text as studymetadata_study_id,
  data_category::text as data_category
from {{ program_ref }}    