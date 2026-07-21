

select distinct
  "Bucket" as bucket,
  "Key" as key,
  "LastModified" as last_modified,
  "ETag" as etag,
  "Size" as size,
  "StorageClass" as storage_class
from "includewarehouse"."dev_kids_first_sd_1nns3k8v"."kf_sd_1nns3k8v_src_s3"