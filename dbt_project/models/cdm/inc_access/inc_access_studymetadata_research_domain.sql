{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  studymetadata_study_id::text as studymetadata_study_id,
  research_domain::text as research_domain
    from {{ program_ref }}    