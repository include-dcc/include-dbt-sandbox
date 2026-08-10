{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "family_id",
    null::text as "family_type",
    null::text as "family_description",
    null::text as "consanguinity",
    null::text as "family_study_focus",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    