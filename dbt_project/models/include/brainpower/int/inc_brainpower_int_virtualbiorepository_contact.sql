{{ config(materialized='table') }}

select
  null::integer as virtualbiorepository_vbr_id,
  null::integer as contact_id
where 1 = 0
    