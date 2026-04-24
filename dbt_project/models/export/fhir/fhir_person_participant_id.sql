{{ config(materialized='table') }}

    select
    person_person_id::text as "Person_person_id",
    participant_id_participant_id::text as "participant_id_participant_id"
    from {{ ref('access_person_participant_id') }}
    