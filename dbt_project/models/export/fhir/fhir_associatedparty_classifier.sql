{{ config(materialized='table') }}

    select
    associatedparty_id::text as "AssociatedParty_id",
    classifier::text as "classifier"
    from {{ ref('access_associatedparty_classifier') }}
    