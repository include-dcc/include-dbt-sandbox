

select
  studymetadata_study_id::text as studymetadata_study_id,
  clinical_data_source_type::text as clinical_data_source_type
from "includewarehouse"."dev_combined"."combined_studymetadata_clinical_data_source_type"