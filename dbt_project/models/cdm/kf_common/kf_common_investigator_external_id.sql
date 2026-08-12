{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    investigator_id::integer as "investigator_id",
    external_id::text as "external_id"
    from {{ program_ref }}
    