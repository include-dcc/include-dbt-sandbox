{{ config(materialized='table') }}

    select
    concept_curie::text as "concept_curie",
    display::text as "display"
    from {{ ref('combined_concept') }}
    