{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::integer as studymetadata_study_id,
  null::text as participant_lifespan_stage
from {{ program_ref }}    