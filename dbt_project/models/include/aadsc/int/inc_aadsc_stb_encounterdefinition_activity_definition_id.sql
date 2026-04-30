{{ config(materialized='table') }}

    select
    null::text as "encounterdefinition_encounter_definition_id",
    null::text as "activity_definition_id_activity_definition_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    