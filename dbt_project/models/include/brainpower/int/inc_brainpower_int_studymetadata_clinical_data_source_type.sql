{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as clinical_data_source_type
where 1 = 0
    