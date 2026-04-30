{{ config(materialized='table') }}

    select
    null::text as "concept_curie",
    null::text as "display"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    