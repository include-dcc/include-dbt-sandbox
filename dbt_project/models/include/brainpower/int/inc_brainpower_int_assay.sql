{{ config(materialized='table') }}

select
  null::text as assay_id,
  null::text as assay_type,
  null::text as assay_source,
  null::text as activity_definition_id,
  null::text as access_policy_id,
  null::integer as study_id
from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    