{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_study_principal_investigator') }}
