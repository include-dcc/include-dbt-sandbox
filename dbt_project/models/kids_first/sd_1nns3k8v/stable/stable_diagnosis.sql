{{ config(
    schema='stable'
) }}

select distinct 
    diagnosis_id, 
    participant_id,
    source_text_diagnosis, 
    age_at_event_days,
    mondo_id_diagnosis,
    observed
   
from {{ ref('int_diagnosis')}}