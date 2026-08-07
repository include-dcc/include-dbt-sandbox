{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_assay_file_id') }}
