


select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id,
  kf_id,
  sequencing_center_name,
  visible,
  visibility_reason,
  visibility_comment
from "includewarehouse"."dev_kids_first_dataservice_studies"."kf_ds_int_sequencing_center"