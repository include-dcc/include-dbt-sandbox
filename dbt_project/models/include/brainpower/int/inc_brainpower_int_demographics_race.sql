{{ config(materialized='table') }}

select
  null::integer as subject_id,
  null::text as race
where 1 = 0
    