{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "kf_index",
    "Size"::integer as "size",
    "Key"::text as "key",
    "ETag"::text as "etag",
    "Bucket"::text as "bucket",
    "LastModified"::text as "lastmodified",
    "StorageClass"::text as "storageclass"
    from {{ source('chr_18', 's3_scrape_cody') }}
    