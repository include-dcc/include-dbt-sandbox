{{ config(materialized='table') }}

select
  null::text as file_file_id,
  null::integer as sample_id_sample_id
where 1 = 0
    