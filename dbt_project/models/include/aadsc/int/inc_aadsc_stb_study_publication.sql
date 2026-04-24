{{ config(materialized='table') }}

    select
    null::text as "study_study_id",
    null::integer as "publication_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    