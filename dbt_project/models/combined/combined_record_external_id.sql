{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_record_external_id') }}
