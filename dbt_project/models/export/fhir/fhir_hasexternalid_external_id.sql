{{ config(materialized='table') }}

    select
    hasexternalid_id::integer as "HasExternalId_id",
    external_id::text as "external_id"
    from {{ ref('access_hasexternalid_external_id') }}
    