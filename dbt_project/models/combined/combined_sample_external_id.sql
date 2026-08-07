{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_sample_external_id') }}
