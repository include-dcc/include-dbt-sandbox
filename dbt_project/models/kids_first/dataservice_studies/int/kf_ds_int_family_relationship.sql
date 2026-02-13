{{ config(
    schema='int'
) }}

select distinct 
  uuid, -- we can leave this out, it's not used
  created_at,
  modified_at,
  external_id, -- i think we can leave this out - it's rarely populated/used, 
  participant1_id,
  participant2_id,
  participant1_to_participant2_relation,
  participant2_to_participant1_relation,
  kf_id as relationship_id,
  visible,
  visibility_reason,
  visibility_comment,
  source_text_notes -- don't think we need this? we never populate it
from {{ref('kf_ds_src_family_relationship')}}
