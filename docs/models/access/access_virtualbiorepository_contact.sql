

select
  virtualbiorepository_vbr_id::text as virtualbiorepository_vbr_id,
  contact_id::integer as contact_id
from "includewarehouse"."dev_combined"."combined_virtualbiorepository_contact"