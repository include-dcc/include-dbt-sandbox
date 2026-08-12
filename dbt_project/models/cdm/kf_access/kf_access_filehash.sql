{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    id::integer as "id",
    hash_type::text as "hash_type",
    hash_value::text as "hash_value"
    from {{ program_ref }}
    