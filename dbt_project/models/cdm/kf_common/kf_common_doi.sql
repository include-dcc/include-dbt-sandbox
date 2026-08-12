{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    do_id::text as "do_id",
    bibliographic_reference::text as "bibliographic_reference",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    