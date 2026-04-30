{{ config(materialized='table') }}

    select
    null::text as "demographics_subject_id",
    null::text as "race"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    