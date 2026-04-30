{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "hash_type",
    null::text as "hash_value"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    