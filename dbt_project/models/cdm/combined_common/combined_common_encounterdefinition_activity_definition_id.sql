{{ config(materialized='table') }}

    select
    null::text as "encounterdefinition_encounter_definition_id",
    null::text as "activity_definition_id_activity_definition_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    