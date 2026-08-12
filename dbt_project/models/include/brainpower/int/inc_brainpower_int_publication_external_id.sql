{{ config(materialized='table') }}

select
  null::integer as publication_id,
  null::text as external_id
where 1 = 0
    