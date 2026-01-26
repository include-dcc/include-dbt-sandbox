{{ config(
    schema='int'
) }}

select distinct 
  uuid, -- we can leave this out; it's not used,
  kf_id as phenotype_id, 
  lower(replace(kf_id, '_', '-')) as dewrangle_phenotype_id,
  participant_id,
  source_text_phenotype, 
  age_at_event_days,
  hpo_id_phenotype,
  observed,

  -- additional fields that may be included
  snomed_id_phenotype,
  external_id
    
from {{ ref('kf_sd_1nns3k8v_src_phenotype') }}
