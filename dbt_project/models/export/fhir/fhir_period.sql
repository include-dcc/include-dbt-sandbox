{{ config(materialized='table') }}

    select
    period_id::text as "period_id",
    start::text as "start",
    end::text as "end"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    