{{ config(materialized='table') }}

select
    null::text as "studymetadata_study_id",
    lower(s.participant_lifespan_stage)::text as "participant_lifespan_stage"
from {{ ref('inc_brainpower_src_study') }} as s
    