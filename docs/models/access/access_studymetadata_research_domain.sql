

select
  studymetadata_study_id::text as studymetadata_study_id,
  research_domain::text as research_domain
from "includewarehouse"."dev_combined"."combined_studymetadata_research_domain"