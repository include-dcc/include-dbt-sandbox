{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  subject_id::text as subject_id,
  subject_type::text as subject_type,
  organism_type::text as organism_type,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id
    from {{ program_ref }}    