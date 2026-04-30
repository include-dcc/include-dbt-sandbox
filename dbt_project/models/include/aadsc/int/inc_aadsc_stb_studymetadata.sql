{{ config(materialized='table') }}

    select
    null::text as "study_id",
    null::text as "selection_criteria",
    null::text as "vbr_id",
    null::integer as "expected_number_of_participants",
    null::integer as "actual_number_of_participants",
    null::text as "access_policy_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    