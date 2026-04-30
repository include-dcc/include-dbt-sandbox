{{ config(materialized='table') }}

    select
    institution_institution_id::text as "Institution_institution_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    