{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_familymembership_external_id') }}
