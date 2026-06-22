{{ config(materialized='table') }}

    select
    null::text as "file_id",
    file_name as "filename",
    null::text as "format",
    null::text as "data_category",
    file_type as "data_type",
    file_size as "size",
    -- Need to determine when DRS indexing will happen
    -- null::text as "staging_url",
    -- null::text as "release_url",
    -- null::text as "drs_uri",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::integer as "hash_id"
    from {{ ref('kf_chr_18_src_ha_delivery_manifest_6735') }}
    