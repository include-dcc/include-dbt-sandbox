{{ config(materialized='table') }}

select
    null::text as "study_study_id",
    string_to_table(replace(lower(s."Study Design"), ' ', '_'), '|')::text as "study_design"
from {{ ref('study') }} as s
    