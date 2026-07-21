

select
  null::text as study_id,
  null::text as selection_criteria,
  null::text as vbr_id,
  s.expected_number_of_participants::integer as expected_number_of_participants,
  null::integer as actual_number_of_participants, -- not in a table to join to
  null::text as access_policy_id
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s