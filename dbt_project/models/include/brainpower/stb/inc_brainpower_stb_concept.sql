{{ config(materialized='table') }}

select
    map.code::text as "concept_curie",
    map.display::text as "display"
from {{ ref('BrainPower_MD_mappings') }} as map

union all

select
    enumeration_meaning::text as "concept_curie",
    enumeration_display::text as "display"
from {{ ref('inc_kf_access_enums_20260508') }}
where enumeration_meaning is not null