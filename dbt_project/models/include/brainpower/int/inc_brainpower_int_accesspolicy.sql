{{ config(materialized='table') }}

    select
    null::text as "access_policy_id",
    null::text as "data_use_accession",
    null::text as "data_use_permission",
    null::text as "data_use_modifier",
    null::text as "disease_limitation",
    null::text as "access_description",
    null::text as "website"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    