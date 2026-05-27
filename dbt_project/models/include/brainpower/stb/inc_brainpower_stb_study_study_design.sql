{{ config(materialized='table') }}

select
    null::text as "study_study_id",
    string_to_table(replace(lower(s.study_design), ' ', '_'), '|')::text as "study_design"
from {{ ref('inc_brainpower_src_study') }} as s
    