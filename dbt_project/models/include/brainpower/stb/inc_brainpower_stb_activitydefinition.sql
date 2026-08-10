{{ config(materialized='table') }}

select
  null::text as activity_definition_id,
  table_name::text as name,
  null::text as description,
  null::text as access_policy_id,
  null::text as study_id
from {{ ref('inc_brainpower_src_tablename_key') }}
    