{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as biospecimen_collection_id,
  null::text as age_at_collection,
  null::text as method,
  null::text as site,
  null::text as spatial_qualifier,
  null::text as laterality,
  null::text as encounter_id,
  null::text as access_policy_id,
  null::integer as study_id
from {{ program_ref }}    