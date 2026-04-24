{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_sample_storage_method') }}
