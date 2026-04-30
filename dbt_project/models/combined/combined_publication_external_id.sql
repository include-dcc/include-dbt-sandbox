{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_publication_external_id') }}
