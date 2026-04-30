{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "study_design"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    