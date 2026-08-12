{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  file_id::text as file_id,
  filename::text as filename,
  file_extension::text as file_extension,
  format::text as format,
  data_category::text as data_category,
  data_type::text as data_type,
  size::integer as size,
  internal_uri::text as internal_uri,
  release_uri::text as release_uri,
  drs_uri::text as drs_uri,
  storage_class::text as storage_class,
  availability::text as availability,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id,
  hash_id::integer as hash_id
from {{ program_ref }}    