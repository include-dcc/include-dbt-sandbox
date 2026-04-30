{{ config(materialized='table') }}

    select
    null::text as "familyrelationship_family_relationship_id",
    null::text as "external_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    