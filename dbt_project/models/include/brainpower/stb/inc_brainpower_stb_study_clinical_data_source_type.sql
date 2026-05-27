{{ config(materialized='table') }}
with pass_one as(
select
    null::text as "study_study_id",
    string_to_table(replace(lower(s.clinical_data_source_type), ' ', '_'), '|')::text as "clinical_data_source_type"
from {{ ref('inc_brainpower_src_study') }} as s)

select
    study_study_id as "study_study_id",
    replace(clinical_data_source_type, 'wearable', 'other') as "clinical_data_source_type"
from pass_one