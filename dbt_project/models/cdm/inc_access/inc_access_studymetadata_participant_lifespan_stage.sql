{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  studymetadata_study_id::text as studymetadata_study_id,
  participant_lifespan_stage::text as participant_lifespan_stage
    from {{ program_ref }}    