

select
  familymember_id::integer as familymember_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_familymember_external_id"