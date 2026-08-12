{{ config(materialized='table') }}

select
  null::text as file_file_id,
  null::text as external_id
where 1 = 0
    