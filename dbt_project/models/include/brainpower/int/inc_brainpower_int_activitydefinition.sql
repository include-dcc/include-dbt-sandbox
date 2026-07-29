{{ config(materialized='table') }}

with base as (
select
  null::text as activity_definition_id,
  table_name::text as name,
  null::text as description,
  null::text as access_policy_id,
  null::text as study_id
from {{ ref('inc_brainpower_src_tablename_key') }}
)

select 
  distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['name']) }}::text as activity_definition_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}