{{ config(materialized='table') }}

    select
    null::text as "file_id",
    null::text as "filename",
    null::text as "format",
    null::text as "data_category",
    null::text as "data_type",
    null::integer as "size",
    null::text as "staging_url",
    null::text as "release_url",
    null::text as "drs_uri",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::integer as "hash_id"
    from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
    