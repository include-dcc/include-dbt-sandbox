{{ config(materialized='table') }}

select
    null::text as "study_study_id",
    lower(s."Program")::text as "program"
from {{ ref('study') }} as s