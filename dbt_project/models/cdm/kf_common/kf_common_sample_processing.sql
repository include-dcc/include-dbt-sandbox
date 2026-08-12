{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    sample_sample_id::integer as "sample_sample_id",
    processing::text as "processing"
    from {{ program_ref }}
    