{{ config(materialized='table') }}

    select
    null::text as "concept_curie",
    null::text as "display"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    