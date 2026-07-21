

select
  null::text as study_study_id,
  string_to_table(replace(lower(s.study_design), ' ', '_'), '|')::text as study_design
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s