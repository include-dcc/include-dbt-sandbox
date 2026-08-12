{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::text as external_id
from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    