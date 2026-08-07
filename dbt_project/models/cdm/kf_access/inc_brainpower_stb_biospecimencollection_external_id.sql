{{ config(materialized='table') }}

    select
    null::text as "biospecimencollection_biospecimen_collection_id",
    null::text as "external_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    