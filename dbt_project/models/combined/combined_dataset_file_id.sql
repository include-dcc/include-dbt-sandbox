{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_dataset_file_id') }}
