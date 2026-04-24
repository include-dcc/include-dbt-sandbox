{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_study_funding_source') }}
