{{ config(materialized='table') }}

    select
    null::text as "parent_study",
    null::text as "study_title",
    null::text as "study_code",
    null::text as "study_short_name",
    null::text as "study_description",
    null::text as "website",
    null::text as "acknowledgments",
    null::text as "citation_statement",
    null::text as "do_id",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('inc_aadsc_src_chicoine_down_syndrome_extract') }}
    