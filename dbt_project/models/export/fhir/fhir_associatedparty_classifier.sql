{{ config(materialized='table') }}

    select
    associatedparty_id::text as "AssociatedParty_id",
    classifier::text as "classifier"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    