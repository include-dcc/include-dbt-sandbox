{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    family_membership_id::text as "family_membership_id",
    family_id::text as "family_id",
    subject_id::integer as "subject_id",
    family_role::text as "family_role",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    