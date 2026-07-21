

select
  study_study_id::text as study_study_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_study_external_id"