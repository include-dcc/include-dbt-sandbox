{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    demographics_subject_id::integer as "demographics_subject_id",
    race::text as "race"
    from {{ program_ref }}
    