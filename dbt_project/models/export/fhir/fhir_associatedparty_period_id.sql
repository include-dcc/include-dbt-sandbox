{{ config(materialized='table') }}

    select
    associatedparty_id::text as "AssociatedParty_id",
    period_id_period_id::text as "period_id_period_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    