{{ config(materialized='table') }}

select
  null::integer as sample_sample_id,
  null::text as storage_method
where 1 = 0
    