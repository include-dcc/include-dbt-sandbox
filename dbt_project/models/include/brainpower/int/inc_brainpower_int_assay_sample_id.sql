{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::integer as sample_id_sample_id
from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    