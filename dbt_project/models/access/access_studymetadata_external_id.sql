{{ config(materialized='table') }}

    select
    studymetadata_study_id::integer as "studymetadata_study_id",
    external_id::text as "external_id"
    from {{ ref('combined_studymetadata_external_id') }}
    