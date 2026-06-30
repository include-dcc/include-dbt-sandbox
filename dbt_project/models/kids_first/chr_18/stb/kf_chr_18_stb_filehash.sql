{{ config(materialized='table') }}

    select
    null::integer as "id",
    'etag' as "hash_type",
    etag as "hash_value"
    from {{ ref('kf_chr_18_int_s3') }}
    