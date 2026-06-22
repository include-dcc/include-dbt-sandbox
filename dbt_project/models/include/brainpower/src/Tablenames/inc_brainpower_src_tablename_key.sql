{{ config(materialized='table') }}

select
  ROW_NUMBER() over () as inc_index,
  table_name::text as table_name
from {{ source('brainpower', 'tablename_key') }}
    