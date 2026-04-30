{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_studymetadata_data_category') }}
