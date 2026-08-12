{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    subjectassertion_assertion_id::text as "subjectassertion_assertion_id",
    concept_concept_curie::text as "concept_concept_curie"
    from {{ program_ref }}
    