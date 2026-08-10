{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    study_study_id::integer as "study_study_id",
    contact_id::integer as "contact_id"
    from {{ program_ref }}
    