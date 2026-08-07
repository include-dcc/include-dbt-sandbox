{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_familyrelationship_external_id') }}
