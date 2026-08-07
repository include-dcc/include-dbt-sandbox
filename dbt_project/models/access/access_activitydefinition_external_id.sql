{{ config(materialized='table') }}

    select
    activitydefinition_activity_definition_id::text as "activitydefinition_activity_definition_id",
    external_id::text as "external_id"
    from {{ ref('combined_activitydefinition_external_id') }}
    