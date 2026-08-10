{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    subject_id::integer as "subject_id",
    sex::text as "sex",
    ethnicity::text as "ethnicity",
    age_at_last_vital_status::integer as "age_at_last_vital_status",
    vital_status::text as "vital_status",
    age_at_first_engagement::integer as "age_at_first_engagement",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    