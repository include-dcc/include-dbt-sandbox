{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_study_clinical_data_source_type') }}
