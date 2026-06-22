{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "kf_index",
    "type"::text as "type",
    "sample.sample_id"::text as "sample",
    "file_name"::text as "file_name",
    "file_type"::text as "file_type",
    "file_description"::text as "file_description",
    "file_size"::integer as "file_size",
    "md5sum"::text as "md5sum",
    "library_id"::text as "library_id",
    "library_strategy"::text as "library_strategy",
    "library_layout"::text as "library_layout",
    "library_source"::text as "library_source",
    "platform"::text as "platform",
    "instrument_model"::text as "instrument_model"
    from {{ source('chr_18', 'ha_delivery_manifest_6735') }}
    