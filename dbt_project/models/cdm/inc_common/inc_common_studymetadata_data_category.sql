{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::integer as "studymetadata_study_id",
    null::text as "data_category"
    from {{ program_ref }}    