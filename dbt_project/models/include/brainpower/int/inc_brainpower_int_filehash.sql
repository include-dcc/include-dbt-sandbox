{{ config(materialized='table') }}

select
  null::integer as id,
  null::text as hash_type,
  null::text as hash_value
where 1 = 0
    