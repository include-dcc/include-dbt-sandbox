{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  id::integer as id,
  bibliographic_reference::text as bibliographic_reference,
  website::text as website,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id
    from {{ program_ref }}    