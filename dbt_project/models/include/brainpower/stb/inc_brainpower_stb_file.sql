{{ config(materialized='table') }}

select
    null::text as "file_id",
    df.file_name::text as "filename",
    null::text as "format",
    string_to_table(replace(lower(df.data_category), ' ', '_'), '|')::text as "data_category",
    null::text as "data_type",
    df.file_size::integer as "size",
    null::text as "staging_url",
    df.file_s3_location::text as "release_url",
    df.drs_uri::text as "drs_uri",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::integer as "hash_id"
from {{ ref('inc_brainpower_src_brainpower_datafile_manifest_2025_06_26') }} as df
    