

select
  investigator_id::integer as investigator_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_investigator_external_id"