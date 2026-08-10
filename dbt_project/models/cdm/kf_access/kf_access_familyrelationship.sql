{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    family_relationship_id::text as "family_relationship_id",
    family_member_id::integer as "family_member_id",
    relation::text as "relation",
    subject_id::integer as "subject_id",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    