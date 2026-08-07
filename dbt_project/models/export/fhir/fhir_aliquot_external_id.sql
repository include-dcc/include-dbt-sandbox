{{ config(materialized='table') }}

    select
    aliquot_aliquot_id::text as "Aliquot_aliquot_id",
    external_id::text as "external_id"
    from {{ ref('access_aliquot_external_id') }}
    