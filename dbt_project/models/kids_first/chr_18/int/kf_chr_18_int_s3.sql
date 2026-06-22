{{ config(materialized='table') }}

    select
    kf_index,
    size,
    key,
    etag,
    bucket,
    lastmodified,
    storageclass
    from {{ ref('kf_chr_18_src_s3_scrape_cody') }}
    