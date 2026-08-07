{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_publication_external_id') }}
