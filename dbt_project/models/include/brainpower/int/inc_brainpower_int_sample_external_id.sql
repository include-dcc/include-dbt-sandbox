{{ config(materialized='table') }}

select
  null::integer as sample_sample_id,
  null::text as external_id
where 1 = 0
    