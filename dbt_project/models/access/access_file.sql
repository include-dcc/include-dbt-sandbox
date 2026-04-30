{{ config(materialized='table') }}

    select
    file_id::text as "file_id",
    filename::text as "filename",
    format::text as "format",
    data_category::text as "data_category",
    data_type::text as "data_type",
    size::integer as "size",
    staging_url::text as "staging_url",
    release_url::text as "release_url",
    drs_uri::text as "drs_uri",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id",
    hash_id::integer as "hash_id"
    from {{ ref('combined_file') }}
    