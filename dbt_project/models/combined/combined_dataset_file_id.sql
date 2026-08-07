{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_dataset_file_id') }}
