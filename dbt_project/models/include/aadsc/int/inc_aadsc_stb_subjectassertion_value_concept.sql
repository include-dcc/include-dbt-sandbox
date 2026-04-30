{{ config(materialized='table') }}

    select
    null::text as "subjectassertion_assertion_id",
    null::text as "value_concept_concept_curie"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    