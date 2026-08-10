{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "family_membership_id",
    null::text as "family_id",
    null::integer as "subject_id",
    null::text as "family_role",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    