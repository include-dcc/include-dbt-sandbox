{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::text as external_id
where 1 = 0
    