

select
  null::text as encounter_definition_id,
  timepoint::text as name,
  visit_name::text as description,
  null::text as access_policy_id,
  null::text as study_id
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_timepoint_key"