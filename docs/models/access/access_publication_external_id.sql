

select
  publication_id::integer as publication_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_publication_external_id"