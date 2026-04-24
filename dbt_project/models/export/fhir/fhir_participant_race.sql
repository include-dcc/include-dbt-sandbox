{{ config(materialized='table') }}

    select
    participant_participant_id::text as "Participant_participant_id",
    race::text as "race"
    from {{ ref('access_participant_race') }}
    