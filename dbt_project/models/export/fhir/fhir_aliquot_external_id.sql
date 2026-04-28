{{ config(materialized='table') }}

    select
    aliquot_aliquot_id::text as "Aliquot_aliquot_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    