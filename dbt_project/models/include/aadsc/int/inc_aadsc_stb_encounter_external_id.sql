{{ config(materialized='table') }}

    select
    null::text as "encounter_encounter_id",
    null::text as "external_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    