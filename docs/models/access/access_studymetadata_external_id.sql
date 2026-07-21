

select
  studymetadata_study_id::text as studymetadata_study_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_studymetadata_external_id"