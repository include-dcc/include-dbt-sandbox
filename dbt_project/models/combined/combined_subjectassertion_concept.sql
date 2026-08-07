{{ config(materialized='table') }}

select *
from {{ ref('inc_brainpower_stb_subjectassertion_concept') }}
