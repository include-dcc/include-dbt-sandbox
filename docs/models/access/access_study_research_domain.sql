

select
  study_study_id::text as study_study_id,
  research_domain::text as research_domain
from "includewarehouse"."dev_combined"."combined_study_research_domain"