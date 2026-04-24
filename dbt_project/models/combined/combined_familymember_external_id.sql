{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_familymember_external_id') }}
