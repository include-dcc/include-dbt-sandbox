{{ config(materialized='table') }}

    select
    participant_id::text as "participant_id",
    file_format::text as "file_format",
    file_size::text as "file_size",
    file_size_unit::text as "file_size_unit",
    content_version::text as "content_version",
    file_type::text as "file_type",
    file_hash::text as "file_hash",
    file_hash_type::text as "file_hash_type",
    description::text as "description",
    file_global_id::text as "file_global_id",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_ncpifile') }}
    