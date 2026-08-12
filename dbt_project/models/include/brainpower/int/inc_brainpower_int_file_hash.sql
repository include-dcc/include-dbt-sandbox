{{ config(materialized='table') }}

select
  null::text as file_file_id,
  null::integer as hash_id
where 1 = 0
    