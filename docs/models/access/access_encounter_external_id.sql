

select
  encounter_encounter_id::text as encounter_encounter_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_encounter_external_id"