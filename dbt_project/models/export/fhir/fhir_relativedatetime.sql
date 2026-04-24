{{ config(materialized='table') }}

    select
    offset::integer as "offset",
    offset_end::integer as "offset_end",
    offset_type::text as "offset_type",
    id::text as "id"
    from {{ ref('access_relativedatetime') }}
    