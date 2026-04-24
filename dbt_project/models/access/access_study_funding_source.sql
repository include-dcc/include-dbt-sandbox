{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    funding_source::text as "funding_source"
    from {{ ref('combined_study_funding_source') }}
    