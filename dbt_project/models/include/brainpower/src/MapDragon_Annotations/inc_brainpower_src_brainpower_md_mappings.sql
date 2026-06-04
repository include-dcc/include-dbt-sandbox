{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  study_title::text as study_title,
  study_name::text as study_name,
  study_id::text as study_id,
  dd_name::text as dd_name,
  dd_id::text as dd_id,
  version::text as version,
  table_id::text as table_id,
  "local code"::text as local_code,
  text::text as text,
  table_name::text as table_name,
  parent_varname::text as parent_varname,
  "local code system"::text as local_code_system,
  mapping_relationship::text as mapping_relationship,
  code::text as code,
  display::text as display,
  "code system"::text as code_system,
  comment::text as comment
from {{ source('brainpower', 'brainpower_md_mappings') }}
    