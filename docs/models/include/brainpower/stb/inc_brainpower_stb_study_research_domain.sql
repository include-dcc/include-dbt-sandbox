

select
  null::text as study_study_id,
  string_to_table(replace(lower(s.research_domain), ' ', '_'), '|')::text as research_domain
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s