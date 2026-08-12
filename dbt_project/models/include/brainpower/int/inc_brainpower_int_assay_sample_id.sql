{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::integer as sample_id_sample_id
where 1 = 0
    