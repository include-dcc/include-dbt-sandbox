

select
  record_id::integer as record_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_record_external_id"