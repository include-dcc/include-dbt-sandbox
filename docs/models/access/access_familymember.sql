

select
  id::integer as id,
  family_id::text as family_id,
  subject_id::text as subject_id,
  family_role::text as family_role,
  access_policy_id::text as access_policy_id,
  study_id::text as study_id
from "includewarehouse"."dev_combined"."combined_familymember"