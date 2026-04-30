{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "family_id",
    null::text as "subject_id",
    null::text as "family_role",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    