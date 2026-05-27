{{ config(materialized='table') }}

    select
    null::text as "subjectassertion_assertion_id",
    null::text as "concept_concept_curie"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    