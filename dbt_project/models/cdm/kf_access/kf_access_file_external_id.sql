{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    file_file_id::text as "file_file_id",
    external_id::text as "external_id"
    from {{ program_ref }}
    