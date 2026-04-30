{{ config(materialized='table') }}

    select
    demographics_subject_id::text as "demographics_subject_id",
    race::text as "race"
    from {{ ref('combined_demographics_race') }}
    