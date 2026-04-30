{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_aliquot_external_id') }}
