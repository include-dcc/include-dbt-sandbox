

select
  null::text as subject_id,
  null::text as subject_type,
  null::text as organism_type,
  null::text as access_policy_id,
  null::text as study_id,
  null::text as external_id
from "includewarehouse"."dev_include_brainpower_src"."inc_brainpower_src_inc_kf_access_enums_20260508"
where enumeration_code = 'participant'