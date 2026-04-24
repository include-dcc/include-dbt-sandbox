{{ config(materialized='table') }}

    select
    subjectassertion_assertion_id::text as "subjectassertion_assertion_id",
    concept_concept_curie::text as "concept_concept_curie"
    from {{ ref('combined_subjectassertion_concept') }}
    