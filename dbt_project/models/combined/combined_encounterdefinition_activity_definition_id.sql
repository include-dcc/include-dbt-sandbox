{{ config(materialized='table') }}

select *
from {{ ref('inc_aadsc_stb_encounterdefinition_activity_definition_id') }}
