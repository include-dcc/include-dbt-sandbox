{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_aliquot_external_id') }}
