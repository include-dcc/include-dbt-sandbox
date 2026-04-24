{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_investigator_external_id') }}
