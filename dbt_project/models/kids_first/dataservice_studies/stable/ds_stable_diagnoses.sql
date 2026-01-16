{{ config(
    schema='stable'
) }}

select distinct 
  uuid, -- we can leave this out; it's not used,
  diagnosis_id, 
  dewrangle_diagnosis_id,
  participant_id,
  source_text_diagnosis, 
  age_at_event_days,
  mondo_id_diagnosis,
  icd_id_diagnosis,
  observed, -- implied by presence in diagnosis table

  -- unsure if necessary to include tehse fields
  diagnosis_category,
  external_id,
  source_text_tumor_location,
  uberon_id_tumor_location,
  spatial_descriptor
   
from {{ ref('int_diagnosis') }}