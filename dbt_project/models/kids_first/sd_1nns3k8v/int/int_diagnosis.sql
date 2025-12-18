{{ config(
    schema='int'
) }}

select distinct 
    kf_id as diagnosis_id, 
    participant_id,
    source_text_diagnosis, 
    age_at_event_days,
    mondo_id_diagnosis,
    'Positive' as observed
   
from {{ ref('src_diagnosis')}}