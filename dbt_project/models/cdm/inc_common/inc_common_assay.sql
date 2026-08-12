{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as assay_id,
  null::text as assay_type,
  null::text as assay_source,
  null::text as activity_definition_id,
  null::text as access_policy_id,
  null::integer as study_id
from {{ program_ref }}    