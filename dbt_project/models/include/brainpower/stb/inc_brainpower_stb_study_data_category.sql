{{ config(materialized='table') }}

with categories as(
  select
    null::text as study_study_id,
    string_to_table(replace(lower(s.data_category), ' ', '_'), '|')::text as data_category
  from {{ ref('inc_brainpower_src_study') }} as s
)

select
  study_study_id,
  replace(data_category, '/', '_') as data_category
from categories