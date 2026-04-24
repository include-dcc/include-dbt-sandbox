{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "funding_source"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    