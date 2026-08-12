{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  study_study_id::text as study_study_id,
  publication_id::integer as publication_id
from {{ program_ref }}    