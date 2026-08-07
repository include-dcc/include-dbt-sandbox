{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_virtualbiorepository_external_id') }}
