{{ config(materialized='table') }}

    select
    studymetadata_study_id::integer as "studymetadata_study_id",
    data_category::text as "data_category"
    from {{ ref('combined_studymetadata_data_category') }}
    