{{ config(materialized='table') }}

    select
    null::integer as "virtualbiorepository_vbr_id",
    null::integer as "contact_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    