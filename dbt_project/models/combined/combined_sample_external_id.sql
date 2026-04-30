{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_sample_external_id') }}
