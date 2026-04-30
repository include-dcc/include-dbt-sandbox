{{ config(materialized='table') }}

    select
    value_type::text as "value_type",
    relative_date_time_id::text as "relative_date_time_id",
    age_code::text as "age_code",
    as_date::text as "as_date",
    id::text as "id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    