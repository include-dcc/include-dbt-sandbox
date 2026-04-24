{{ config(materialized='table') }}

    select
    virtualbiorepository_vbr_id::text as "virtualbiorepository_vbr_id",
    external_id::text as "external_id"
    from {{ ref('combined_virtualbiorepository_external_id') }}
    