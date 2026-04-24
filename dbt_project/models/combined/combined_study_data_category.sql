{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_study_data_category') }}
