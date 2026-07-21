

select
  null::text as subjectassertion_assertion_id,
  code::text as concept_concept_curie
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_brainpower_md_mappings"
where table_name = 'Health Conditions' or table_name = 'Anthropometrics'