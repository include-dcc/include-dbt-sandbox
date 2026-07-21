

select
  demographics_subject_id::text as demographics_subject_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_demographics_external_id"