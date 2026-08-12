{{ config(materialized='table') }}

select
  null::integer as study_study_id,
  null::integer as principal_investigator_id
where 1 = 0
    