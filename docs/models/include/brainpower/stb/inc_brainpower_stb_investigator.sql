

select
  null::integer as id,
  string_to_table(s.principal_investigator_name, '|')::text as name,
  s.study_contact_institution::text as institution,
  null::text as investigator_title,
  s.study_contact_email::text as email,
  null::text as access_policy_id,
  null::text as study_id
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s