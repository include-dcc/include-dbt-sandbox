

select
  null::text as studymetadata_study_id,
  lower(s.participant_lifespan_stage)::text as participant_lifespan_stage
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_study" as s