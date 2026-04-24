{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_subject_external_id') }}
