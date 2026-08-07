{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_studymetadata_clinical_data_source_type') }}
