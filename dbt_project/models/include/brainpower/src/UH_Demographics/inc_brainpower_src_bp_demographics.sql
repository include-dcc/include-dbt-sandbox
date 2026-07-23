{{ config(materialized='table') }}

select
  -- id + race + filedomain_name(demographics) as inc_key,
  id::integer as id,
  timepoint::integer as timepoint,
  gender::integer as gender,
  level_support::integer as level_support,
  race::integer as race,
  ethnicity::integer as ethnicity
from {{ source('brainpower', 'bp_demographics') }}
    