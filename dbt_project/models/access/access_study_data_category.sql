{{ config(materialized='table') }}

    select
    study_study_id::text as "study_study_id",
    data_category::text as "data_category"
    from {{ ref('combined_study_data_category') }}
    