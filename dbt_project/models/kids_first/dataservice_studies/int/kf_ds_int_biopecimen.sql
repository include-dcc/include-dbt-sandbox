{{ config(
    schema='int'
) }}

-- need to review all fields in ds and which ones are neeeded
-- for now, extracting the main ones we use 
select distinct 
  uuid, -- we can leave this out; it's not used,
  created_at,
  modified_at,
  kf_id as specimen_id,
  lower(replace(kf_id, '_', '-')) as dewrangle_specimen_id,
  external_sample_id,
  external_aliquot_id,
  source_text_tissue_type, -- can rename without source text prefix? 
  composition,
  source_text_anatomical_site, -- can rename without source text prefix? 
  age_at_event_days,
  source_text_tumor_descriptor,  -- can rename without source text prefix? 
  analyte_type,
  participant_id,
  sequencing_center_id,
  dbgap_consent_code, -- maybe this should be on the pt level? 
  consent_type, -- maybe this should be on the pt level? 
  method_of_sample_procurement, 
  sample_id, -- is this needed? haven't exported 'sample' table for kf
  specimen_status, -- should this be set as a constant for all kf studies ? 
  has_matched_normal_sample, 
  visible,
  visibility_reason,
  visibility_comment,

  -- these are fields we should discuss if needed
  shipment_origin,
  concentration_mg_per_ml,
  volume_ul,
  shipment_date,
  uberon_id_anatomical_site,
  ncit_id_tissue_type,
  ncit_id_anatomical_site,
  spatial_descriptor,
  preservation_method,
  amount,
  amount_units,
  cell_entity 
from {{ ref('kf_ds_src_biospecimen') }}