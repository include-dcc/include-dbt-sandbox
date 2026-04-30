{{ config(materialized='table') }}

    select
    participant_participant_id::text as "Participant_participant_id",
    external_id::text as "external_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    