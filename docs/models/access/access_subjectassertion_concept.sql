

select
  subjectassertion_assertion_id::text as subjectassertion_assertion_id,
  concept_concept_curie::text as concept_concept_curie
from "includewarehouse"."dev_combined"."combined_subjectassertion_concept"