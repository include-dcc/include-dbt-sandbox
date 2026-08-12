{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as external_id
where 1 = 0
    