{{ config(materialized='table') }}

    select
    null::text as "activitydefinition_activity_definition_id",
    null::text as "external_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    