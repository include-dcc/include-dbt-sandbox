{{ config(materialized='table') }}

    select
    kf_index,
    type,
    sample,
    file_name,
    file_type,
    file_description,
    file_size,
    md5sum,
    library_id,
    library_strategy,
    library_layout,
    library_source,
    platform,
    instrument_model
    from {{ source('chr_18', 'ha_delivery_manifest_6735') }}
    