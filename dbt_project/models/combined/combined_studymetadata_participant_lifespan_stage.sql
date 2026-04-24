{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_studymetadata_participant_lifespan_stage') }}
