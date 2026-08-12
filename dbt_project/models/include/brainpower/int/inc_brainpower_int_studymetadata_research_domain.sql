{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as research_domain
where 1 = 0
    