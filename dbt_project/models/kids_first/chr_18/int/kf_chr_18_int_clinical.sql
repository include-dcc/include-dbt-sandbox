{{ config(materialized='table') }}
select
  family_id,
  participant_id,
  family_relationship_target_participant_id,
  aliquot_id,
  'GRU' as consent_group,
  age_at_sample,
  case
    when sample_composition = 'Blood' then 'Peripheral Whole Blood'
    when sample_composition = 'Lymphoblastoid Cells' then 'Lymphoblastoid Cell Lines'
  end as sample_composition,
  case
    when race = 'Native American' then 'American Indian or Alaska Native'
    when race = 'Caucasian' then 'White'
    else race
  end as race,
  case
    when sex = 'M' then 'Male'
    when sex = 'F' then 'Female'
  end as sex,
  case
    when ethnicity = 'Not Hispanic' then 'Not Hispanic or Latino'
    when ethnicity = 'Hispanic' then 'Hispanic or Latino'
  end as ethnicity,
  analyte_type,
  -- age_at_phenotype,
  affected_status,
  vital_status,
  sample_tissue_type
from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }} 