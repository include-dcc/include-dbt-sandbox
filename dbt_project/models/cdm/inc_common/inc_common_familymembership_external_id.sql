{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  familymembership_family_membership_id::text as familymembership_family_membership_id,
  external_id::text as external_id
from {{ program_ref }}    