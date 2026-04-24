{{ config(materialized='table') }}

    select
    demographics_subject_id::text as "demographics_subject_id",
    external_id::text as "external_id"
    from {{ ref('combined_demographics_external_id') }}
    