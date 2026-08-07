{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_studymetadata_participant_lifespan_stage') }}
