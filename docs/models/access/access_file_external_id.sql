

select
  file_file_id::text as file_file_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_file_external_id"