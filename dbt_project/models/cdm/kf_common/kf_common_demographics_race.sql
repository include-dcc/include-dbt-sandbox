{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    subject_id::integer as "subject_id",
    race::text as "race"
    from {{ program_ref }}
    