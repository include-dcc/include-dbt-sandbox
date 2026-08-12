{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    studymetadata_study_id::integer as "studymetadata_study_id",
    data_category::text as "data_category"
    from {{ program_ref }}
    