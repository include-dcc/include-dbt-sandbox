{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::integer as "sample_sample_id",
    null::text as "external_id"
    from {{ program_ref }}    