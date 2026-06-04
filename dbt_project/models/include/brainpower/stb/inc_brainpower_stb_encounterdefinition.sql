{{ config(materialized='table') }}

select
  null::text as encounter_definition_id,
  timepoint::text as name,
  visit_name::text as description,
  null::text as access_policy_id,
  null::text as study_id
from {{ ref('inc_brainpower_src_timepoint_key') }}
    