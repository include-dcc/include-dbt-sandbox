{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_virtualbiorepository_external_id') }}
