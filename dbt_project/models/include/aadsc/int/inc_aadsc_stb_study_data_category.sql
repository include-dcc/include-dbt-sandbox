{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "data_category"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    