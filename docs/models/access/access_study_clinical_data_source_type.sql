

select
  study_study_id::text as study_study_id,
  clinical_data_source_type::text as clinical_data_source_type
from "includewarehouse"."dev_combined"."combined_study_clinical_data_source_type"