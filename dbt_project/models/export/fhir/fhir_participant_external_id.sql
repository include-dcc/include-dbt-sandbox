{{ config(materialized='table') }}

    select
    participant_participant_id::text as "Participant_participant_id",
    external_id::text as "external_id"
    from {{ ref('access_participant_external_id') }}
    