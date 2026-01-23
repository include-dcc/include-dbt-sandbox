{{ config(
    schema='int'
) }}

select distinct
  uuid,
  created_at,
  modified_at, 
  investigator_id, 
  dewrangle_investigator_id,
  external_id, 
  name,
  institution,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('kf_sd_1nns3k8v_int_investigator') }}