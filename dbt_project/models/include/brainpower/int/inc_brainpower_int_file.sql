{{ config(materialized='table') }}

with base as(
select
  -- null::text as file_id,
  df.file_name::text as filename,
  null::text as format,
  null::text as file_extension,
  string_to_table(replace(lower(df.data_category), ' ', '_'), '|')::text as data_category,
  null::text as data_type,
  df.file_size::integer as size,
  null::text as internal_uri,
  df.file_s3_location::text as release_uri,
  df.drs_uri::text as drs_uri,
  null::text as storage_class,
  null::text as availability,
  -- null::text as access_policy_id,
  -- null::text as study_id,
  null::integer as hash_id
from {{ ref('inc_brainpower_src_brainpower_datafile_manifest_2025_06_26') }} as df
)

select 
  distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['study_code']) }}::text as study_descriptor,
  {{ normalize_descriptors(descriptor_cols=['release_url']) }}::text as file_descriptor
from base, {{ ref('inc_brainpower_int_manual_supplement') }}

