{{ config(materialized='table') }}

select
    null::text as "file_id",
    df."File Name"::text as "filename",
    null::text as "format",
    string_to_table(replace(lower(df."Data Category"), ' ', '_'), '|')::text as "data_category",
    null::text as "data_type",
    df."File Size"::integer as "size",
    null::text as "staging_url",
    df."File S3 Location"::text as "release_url",
    df."DRS URI"::text as "drs_uri",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::integer as "hash_id"
from {{ ref('brainpower_datafile_manifest_2025-06-26') }} as df
    