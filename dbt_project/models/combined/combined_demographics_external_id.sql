{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_demographics_external_id') }}
