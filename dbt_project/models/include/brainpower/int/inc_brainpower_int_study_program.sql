{{ config(materialized='table') }}

select
  null::integer as study_study_id,
  null::text as program
where 1 = 0
    