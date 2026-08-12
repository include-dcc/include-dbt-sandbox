{{ config(materialized='table') }}

select
  null::integer as study_study_id,
  null::text as funding_source
where 1 = 0
    