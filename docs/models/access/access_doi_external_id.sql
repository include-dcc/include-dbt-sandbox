

select
  doi_do_id::text as doi_do_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_doi_external_id"