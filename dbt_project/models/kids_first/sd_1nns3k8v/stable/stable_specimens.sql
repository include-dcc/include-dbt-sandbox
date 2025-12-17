{{ config(
    schema='stable'
) }}

select distinct 
    uuid,
    created_at,
    modified_at,
    specimen_id,
    dewrangle_specimen_id,
    external_sample_id,
    external_aliquot_id,
    source_text_tissue_type,
    composition,
    source_text_anatomical_site, 
    age_at_event_days,
    source_text_tumor_descriptor, 
    analyte_type,
    participant_id,
    sequencing_center_id,
    dbgap_consent_code, 
    consent_type, 
    method_of_sample_procurement, 
    sample_id, 
    specimen_status, 
    has_matched_normal_sample, 
    visible,
    visibility_reason,
    visibility_comment,

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
from {{ ref('int_specimens')}}