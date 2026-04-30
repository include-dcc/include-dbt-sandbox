{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::text as "research_domain"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    