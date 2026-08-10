{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    concept_curie::text as "concept_curie",
    display::text as "display"
    from {{ program_ref }}
    