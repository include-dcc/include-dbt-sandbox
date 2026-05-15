{{ config(materialized='table') }}

select
    null::text as "study_id",
    null::text as "selection_criteria",
    null::text as "vbr_id",
    s."Expected Number of Participants"::integer as "expected_number_of_participants",
    null::integer as "actual_number_of_participants", -- not in a table to join to
    null::text as "access_policy_id"
from {{ ref('study') }} as s