{{ config(materialized='table') }}

select
  null::text as assay_assay_id,
  null::text as file_id_file_id
where 1 = 0
    