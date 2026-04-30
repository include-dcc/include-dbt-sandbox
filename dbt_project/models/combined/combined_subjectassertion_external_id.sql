{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_subjectassertion_external_id') }}
