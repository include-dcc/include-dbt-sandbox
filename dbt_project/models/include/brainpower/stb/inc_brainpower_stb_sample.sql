{{ config(materialized='table') }}

    select
    null::text as "sample_id",
    null::text as "biospecimen_collection_id",
    null::text as "parent_sample_id",
    null::text as "sample_type",
    null::text as "availablity_status",
    null::text as "quantity_number",
    null::text as "quantity_unit",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    