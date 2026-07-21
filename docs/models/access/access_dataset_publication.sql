

select
  dataset_dataset_id::text as dataset_dataset_id,
  publication_id::integer as publication_id
from "includewarehouse"."dev_combined"."combined_dataset_publication"