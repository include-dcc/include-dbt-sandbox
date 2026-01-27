{{ config(
    schema='int'
) }}

select distinct
  "Bucket" as bucket,
  "Key" as key,
  "LastModified" as last_modified,
  "ETag" as etag,
  "Size" as size,
  "StorageClass" as storage_class
from {{ ref('s3_scrape_cody') }}