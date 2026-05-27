{{ config(materialized='table') }}

select
    null::text as "studymetadata_study_id",
    string_to_table(replace(lower(s.research_domain), ' ', '_'), '|')::text as "research_domain"
from {{ ref('inc_brainpower_src_study') }} as s
    