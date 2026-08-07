{{ config(materialized='table') }}

    select
    encounterdefinition_encounter_definition_id::text as "encounterdefinition_encounter_definition_id",
    activity_definition_id_activity_definition_id::text as "activity_definition_id_activity_definition_id"
    from {{ ref('combined_encounterdefinition_activity_definition_id') }}
    