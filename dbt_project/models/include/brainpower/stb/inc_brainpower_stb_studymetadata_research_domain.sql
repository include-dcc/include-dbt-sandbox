{{ config(materialized='table') }}

select
    null::text as "studymetadata_study_id",
    string_to_table(replace(lower(s."Research Domain"), ' ', '_'), '|')::text as "research_domain"
from {{ ref('study') }} as s
    