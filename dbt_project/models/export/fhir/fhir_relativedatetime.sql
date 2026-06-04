{{ config(materialized='table') }}

select
  "offset"::integer as "offset",
  offset_end::integer as offset_end,  -- "offset_end" is a reserved keyword in SQL, so it needs to be quoted.
  offset_type::text as offset_type,
  id::text as id
-- TODO: Add a valid source model reference.
{# from {{ ref('') }} #}
    