{{ config(
    schema='int'
) }}

select distinct
    "Family ID" as family_id,
    "Participant ID" as participant_id,
    "Family Relationship Target Participant ID" as family_relationship_target_participant_id,
    "alliquot_id" as aliquot_id,
    "Consent Group" as consent_group,
    "Age at Sample" as age_at_sample,
    "Sample Composition" as sample_composition,
    "Sample Tissue Type" as sample_tissue_type,
    "Race" as race,
    "Sex" as sex,
    "Ethnicity" as ethnicity,
    "Analyte Type" as analyte_type,
    "Age at Phenotype" as age_at_phenotype,
    "Affected Status" as affected_status, 
    "Vital Status" as vital_status
from {{ ref('kf_sd_1nns3k8v_src_clinical') }}