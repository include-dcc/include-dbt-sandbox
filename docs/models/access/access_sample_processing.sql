

select
  sample_sample_id::text as sample_sample_id,
  processing::text as processing
from "includewarehouse"."dev_combined"."combined_sample_processing"