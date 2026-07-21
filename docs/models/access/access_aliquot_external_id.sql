

select
  aliquot_aliquot_id::text as aliquot_aliquot_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_aliquot_external_id"