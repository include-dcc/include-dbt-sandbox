{{ config(materialized='table') }}
    select
        family_id,
        participant_id,
        family_relationship_target_participant_id,
        aliquot_id,
        consent_group,
        age_at_sample,
        sample_composition,
        race,
        sex,
        ethnicity,
        analyte_type,
        age_at_phenotype,
        affected_status,
        vital_status,
        sample_tissue_type,
    from ref{{'kf_chr_18_src_chr_18_phenotype_data'}} 