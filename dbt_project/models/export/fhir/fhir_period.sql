{{ config(materialized='table') }}

    select
    period_id::text as "period_id",
    start::text as "start",
    end::text as "end"
    from {{ ref('access_period') }}
    