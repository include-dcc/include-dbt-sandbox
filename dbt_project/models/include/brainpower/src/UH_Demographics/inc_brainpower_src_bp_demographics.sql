{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  id::integer as id,
  timepoint::integer as timepoint,
  gender::integer as gender,
  level_support::integer as level_support,
  race::integer as race,
  ethnicity::integer as ethnicity
from {{ source('brainpower', 'bp_demographics') }}
    