{{ config(materialized='table') }}

    select
    null::text as "sample_sample_id",
    null::text as "processing"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    