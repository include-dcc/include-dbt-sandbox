 {{ config(
    schema='stable'
) }}

select distinct 
    study_id, 
    dewrangle_study_id, 
    participant_id, 
    dewrangle_participant_id, 
    external_id,
    family_id, 
    is_proband,
    race,
    ethnicity,
    gender,
    affected_status,
    species,
    visible,
    visibility_reason, 
    visibility_comment
from {{ ref('int_participant')}}