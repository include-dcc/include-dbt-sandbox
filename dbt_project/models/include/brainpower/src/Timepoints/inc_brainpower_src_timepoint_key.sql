{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  timepoint::text as timepoint,
  visit_name::text as visit_name
from {{ source('brainpower', 'timepoint_key') }}
    