{{ config(materialized='table') }}

    select
    file_id::text as "file_id",
    filename::text as "filename",
    format::text as "format",
    file_extension::text as "file_extension",
    data_category::text as "data_category",
    data_type::text as "data_type",
    size::integer as "size",
    internal_uri::text as "internal_uri",
    release_uri::text as "release_uri",
    drs_uri::text as "drs_uri",
    storage_class::text as "storage_class",
    availability::text as "availability",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ ref('combined_file') }}
    