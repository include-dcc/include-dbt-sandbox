{{ config(materialized='table') }}

select
    null::integer as "id",
    string_to_table(s."Principal Investigator Name", '|')::text as "name",
    s."Study Contact Institution"::text as "institution",
    null::text as "investigator_title",
    s."Study Contact Email"::text as "email",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('study') }} as s