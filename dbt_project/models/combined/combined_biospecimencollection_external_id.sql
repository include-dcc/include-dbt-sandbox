{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_biospecimencollection_external_id') }}
