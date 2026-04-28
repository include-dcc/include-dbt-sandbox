{{ config(materialized='table') }}

    select
    practitioner_practitioner_id::text as "Practitioner_practitioner_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    