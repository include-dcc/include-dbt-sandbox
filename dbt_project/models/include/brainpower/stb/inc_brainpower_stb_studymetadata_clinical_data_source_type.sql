{{ config(materialized='table') }}

with pass_one as(
select
    null::text as "studymetadata_study_id",
    string_to_table(replace(lower(s."Clinical Data Source Type"), ' ', '_'), '|')::text as "clinical_data_source_type"
from {{ ref('study') }} as s)

select
    studymetadata_study_id as "studymetadata_study_id",
    replace(clinical_data_source_type, 'wearable', 'other') as "clinical_data_source_type"
from pass_one