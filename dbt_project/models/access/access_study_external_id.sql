{{ config(materialized='table') }}

    select
    study_study_id::integer as "study_study_id",
    external_id::text as "external_id"
    from {{ ref('combined_study_external_id') }}
    