{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_demographics_external_id') }}
