

select
  subjectassertion_assertion_id::text as subjectassertion_assertion_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_subjectassertion_external_id"