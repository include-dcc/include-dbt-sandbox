{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::integer as "subject_id",
    null::text as "sex",
    null::text as "ethnicity",
    null::integer as "age_at_last_vital_status",
    null::text as "vital_status",
    null::integer as "age_at_first_engagement",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    