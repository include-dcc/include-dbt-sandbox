{{ config(materialized='table') }}

select
    null::text as "studymetadata_study_id",
    lower(s."Participant Lifespan Stage")::text as "participant_lifespan_stage"
from {{ ref('study') }} as s
    