{{ config(materialized='table') }}

select
  null::text as study_study_id,
  lower(s.program)::text as program
from {{ ref('inc_brainpower_src_study') }} as s