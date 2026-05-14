{{ config(materialized='table') }}

select
    null::text as "parent_study",
    "Study Title"::text as "study_title",
    "Study Code"::text as "study_code",
    null::text as "study_short_name",
    "Study Description"::text as "study_description",
    "Study Website"::text as "website",
    "Acknowledgments"::text as "acknowledgments", -- empty for BrainPower
    "Citation Statement"::text as "citation_statement", -- empty for BrainPower
    null::text as "do_id",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('study') }}
    