

select
  biospecimencollection_biospecimen_collection_id::text as biospecimencollection_biospecimen_collection_id,
  external_id::text as external_id
from "includewarehouse"."dev_combined"."combined_biospecimencollection_external_id"