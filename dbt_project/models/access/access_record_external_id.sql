{{ config(materialized='table') }}

    select
    record_id::integer as "record_id",
    external_id::text as "external_id"
    from {{ ref('combined_record_external_id') }}
    