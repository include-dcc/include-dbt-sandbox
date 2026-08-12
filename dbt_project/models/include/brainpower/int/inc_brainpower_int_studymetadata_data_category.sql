{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as data_category
where 1 = 0
    