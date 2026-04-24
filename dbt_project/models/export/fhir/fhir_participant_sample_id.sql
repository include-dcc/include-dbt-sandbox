{{ config(materialized='table') }}

    select
    participant_participant_id::text as "Participant_participant_id",
    sample_id_sample_id::text as "sample_id_sample_id"
    from {{ ref('access_participant_sample_id') }}
    