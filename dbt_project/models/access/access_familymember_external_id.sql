{{ config(materialized='table') }}

    select
    familymember_id::integer as "familymember_id",
    external_id::text as "external_id"
    from {{ ref('combined_familymember_external_id') }}
    