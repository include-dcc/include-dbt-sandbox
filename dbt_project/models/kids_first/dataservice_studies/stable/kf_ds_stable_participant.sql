

select distinct 
  uuid, -- we can leave this out ; it's not used,
  created_at, 
  modified_at,
  alias_group_id, -- we can leave this out; it's not used
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
  visibility_reason, -- can we standardize this a bit more? maybe release status instead of reason? and try to standardize more? 
  visibility_comment
from {{ref('kf_ds_int_participant')}}