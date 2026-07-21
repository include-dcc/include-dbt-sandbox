

select
  null::text as study_study_id,
  lower(s.program)::text as program
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s