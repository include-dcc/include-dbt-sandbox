

select
  demographics_subject_id::text as demographics_subject_id,
  race::text as race
from "includewarehouse"."dev_combined"."combined_demographics_race"