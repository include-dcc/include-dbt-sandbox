{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_study_participant_lifespan_stage') }}
