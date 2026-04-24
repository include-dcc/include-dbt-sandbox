{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_biospecimencollection_external_id') }}
