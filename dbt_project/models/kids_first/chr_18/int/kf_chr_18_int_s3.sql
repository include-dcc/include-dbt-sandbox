{{ config(materialized='table') }}

    select
    's3://' + bucket + '/' + key as s3_path,
    case
        when key.like '%.cram' then 'cram'
        when key.like '%.crai' then 'crai'
        when key.like '%.md5' then 'md5'
        else null
    end as file_format,
    case
        when key.like '%.cram' then 'Aligned Reads'
        when key.like '%.crai' then 'Aligned Reads Index'
        when key.like '%.md5' then 'Other'
        else null
    end as data_type,
    '{etag' + replace(etag, '"', "") + '}' as hash_dict
    from {{ ref('kf_chr_18_src_s3_scrape_cody') }}
    