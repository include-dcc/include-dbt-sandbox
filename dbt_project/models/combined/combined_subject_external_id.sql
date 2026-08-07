{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_subject_external_id') }}
