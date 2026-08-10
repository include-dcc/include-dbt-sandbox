{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::integer as "study_study_id",
    null::text as "funding_source"
    from {{ program_ref }}    