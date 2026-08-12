{{ config(materialized='table') }}

select
  null::integer as studymetadata_study_id,
  null::text as participant_lifespan_stage
where 1 = 0
    