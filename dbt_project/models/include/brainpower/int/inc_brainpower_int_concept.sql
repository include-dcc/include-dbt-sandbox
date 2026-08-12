{{ config(materialized='table') }}

select
  null::text as concept_curie,
  null::text as display
where 1 = 0
    