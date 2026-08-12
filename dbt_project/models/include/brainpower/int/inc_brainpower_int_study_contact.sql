{{ config(materialized='table') }}

select
  null::integer as study_study_id,
  null::integer as contact_id
where 1 = 0
    