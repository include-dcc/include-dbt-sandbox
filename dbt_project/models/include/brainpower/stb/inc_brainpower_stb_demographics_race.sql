{{ config(materialized='table') }}

select
    null::text as "demographics_subject_id",
    race_map.code::text as "race"
from (select * from {{ ref('inc_brainpower_src_bp_demographics') }}) as d
left join (select local_code, code from {{ ref('inc_brainpower_src_brainpower_md_mappings') }} where parent_varname = 'race') as race_map
on cast(d.race as integer) = cast(race_map.local_code as integer)