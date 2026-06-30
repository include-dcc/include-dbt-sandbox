{{ config(materialized='table') }}

    select
    participant_id as "subject_id",
    sex as "sex",
    ethnicity as "ethnicity",
    null::text as "down_syndrome_status", -- could map to Not Applicable?
    null::integer as "age_at_last_vital_status",
    vital_status as "vital_status",
    null::integer as "age_at_first_engagement", -- age at phenotype? or sample?
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_int_clinical') }}
    