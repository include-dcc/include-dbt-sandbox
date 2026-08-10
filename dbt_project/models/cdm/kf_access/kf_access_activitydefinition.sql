{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    activity_definition_id::text as "activity_definition_id",
    name::text as "name",
    description::text as "description",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    