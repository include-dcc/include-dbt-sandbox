{{ config(materialized='table') }}

    select
    null::text as "encounter_definition_id",
    null::text as "name",
    null::text as "description",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    