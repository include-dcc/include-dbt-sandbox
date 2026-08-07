{{ config(materialized='table') }}

    select
    study_study_id::integer as "study_study_id",
    principal_investigator_id::integer as "principal_investigator_id"
    from {{ ref('combined_study_principal_investigator') }}
    