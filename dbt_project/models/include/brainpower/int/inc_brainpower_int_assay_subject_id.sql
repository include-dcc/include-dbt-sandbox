{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::integer as subject_id_subject_id
where 1 = 0
    