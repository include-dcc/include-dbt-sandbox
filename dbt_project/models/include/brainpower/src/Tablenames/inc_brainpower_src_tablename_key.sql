{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "table_name"::text as "table_name"
    from {{ source('brainpower', 'tablename_key') }}
    