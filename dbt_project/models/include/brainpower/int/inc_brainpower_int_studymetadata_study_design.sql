{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as study_design
where 1 = 0
    