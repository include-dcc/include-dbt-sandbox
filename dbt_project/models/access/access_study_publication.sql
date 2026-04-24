{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    publication_id::integer as "publication_id"
    from {{ ref('combined_study_publication') }}
    