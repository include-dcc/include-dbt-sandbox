

select
  studymetadata_study_id::text as studymetadata_study_id,
  data_category::text as data_category
from "includewarehouse"."dev_combined"."combined_studymetadata_data_category"