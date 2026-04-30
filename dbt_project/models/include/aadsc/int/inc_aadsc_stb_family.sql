{{ config(materialized='table') }}

    select
    null::text as "family_id",
    null::text as "family_type",
    null::text as "family_description",
    null::text as "consanguinity",
    null::text as "family_study_focus",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    