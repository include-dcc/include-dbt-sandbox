{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    contact_id::integer as "contact_id"
    from {{ ref('combined_study_contact') }}
    