{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  table_name::text as table_name,
  variable_name::text as variable_name,
  enumeration_code::text as enumeration_code,
  enumeration_display::text as enumeration_display,
  enumeration_title::text as enumeration_title,
  enumeration_meaning::text as enumeration_meaning,
  enumeration_system::text as enumeration_system,
  enumeration_group::text as enumeration_group
from {{ source('brainpower', 'inc_kf_access_enums_20260508') }}
    