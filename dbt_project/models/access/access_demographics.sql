{{ config(materialized='table') }}

    select
    subject_id::text as "subject_id",
    sex::text as "sex",
    ethnicity::text as "ethnicity",
    down_syndrome_status::text as "down_syndrome_status",
    age_at_last_vital_status::integer as "age_at_last_vital_status",
    vital_status::text as "vital_status",
    age_at_first_engagement::integer as "age_at_first_engagement",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id"
    from {{ ref('combined_demographics') }}
    