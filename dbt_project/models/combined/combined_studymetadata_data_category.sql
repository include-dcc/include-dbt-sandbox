{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_studymetadata_data_category') }}
