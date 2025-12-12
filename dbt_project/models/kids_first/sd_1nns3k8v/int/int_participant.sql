{{ config(
    schema='int'
) }}

select distinct 
study_id as study_id, 
lower(replace(study_id, '_', '-')) as dewrangle_study_id, 
kf_id as participant_id, 
lower(replace(kf_id, '_', '-')) as dewrangle_participant_id, 
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
from {{ ref('src_participant')}}