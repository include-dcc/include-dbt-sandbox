{{ config(materialized='table') }}

    select
    null::integer as "id",
    'md5sum' as "hash_type",
    md5sum as "hash_value"
    from {{ ref('kf_chr_18_src_ha_delivery_manifest_6735') }}
    