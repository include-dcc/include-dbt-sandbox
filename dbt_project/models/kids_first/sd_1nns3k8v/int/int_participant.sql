{{ config(
    schema='int'
) }}

select distinct 
    uuid, -- we can leave this out ; it's not used,
    created_at::date, 
    modified_at::date,
    alias_group_id, -- we can leave this out; it's not used
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
    visibility_reason, -- can we standardize this a bit more? maybe release status instead of reason? and try to standardize more? 
    visibility_comment
from {{ ref('src_participant')}}