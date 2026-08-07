{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_investigator_external_id') }}
