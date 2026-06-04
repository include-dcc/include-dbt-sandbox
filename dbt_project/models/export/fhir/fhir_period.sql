{{ config(materialized='table') }}

select
  period_id::text as period_id,
  start::text as start,
  "end"::text as "end" --"end" is a reserved keyword in SQL, so it needs to be quoted.
-- TODO: Add a valid source model reference.
{# from {{ ref('') }} #}
    