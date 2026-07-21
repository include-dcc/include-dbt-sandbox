

select
  study_study_id::text as study_study_id,
  participant_lifespan_stage::text as participant_lifespan_stage
from "includewarehouse"."dev_combined"."combined_study_participant_lifespan_stage"