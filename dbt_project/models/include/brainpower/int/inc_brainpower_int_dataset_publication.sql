{{ config(materialized='table') }}

select
  null::text as dataset_dataset_id,
  null::integer as publication_id
where 1 = 0
    