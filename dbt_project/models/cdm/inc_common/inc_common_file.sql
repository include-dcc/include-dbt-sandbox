{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "file_id",
    null::text as "filename",
    null::text as "format",
    null::text as "file_extension",
    null::text as "data_category",
    null::text as "data_type",
    null::integer as "size",
    null::text as "internal_uri",
    null::text as "release_uri",
    null::text as "drs_uri",
    null::text as "storage_class",
    null::text as "availability",
    null::text as "access_policy_id",
    null::integer as "study_id"
    from {{ program_ref }}    