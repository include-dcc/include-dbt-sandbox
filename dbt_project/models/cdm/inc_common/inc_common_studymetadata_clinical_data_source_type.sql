{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as studymetadata_study_id,
  null::text as clinical_data_source_type
from {{ program_ref }}    