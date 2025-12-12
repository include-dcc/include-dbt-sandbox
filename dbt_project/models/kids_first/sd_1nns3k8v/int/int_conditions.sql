{{ config(
    schema='int'
) }}

with diagnosis as (
    select distinct 
        kf_id as diagnosis_id, 
        participant_id as dx_participant_id, 
        source_text_diagnosis, 
        age_at_event_days as dx_age_at_event_days,
        mondo_id_diagnosis,
        'Positive' as dx_observed
    from {{ ref('src_diagnosis')}}

), 

phenotype as (
    select distinct 
        kf_id as phenotype_id, 
        participant_id as px_participant_id, 
        source_text_phenotype, 
        age_at_event_days as px_age_at_event_days,
        hpo_id_phenotype,
        observed as px_observed 
    from {{ ref('src_phenotype')}}
), 

-- need to re-think this
merged as (
    select distinct *
    from diagnosis dx 
    full join phenotype px on px.source_text_phenotype=dx.source_text_diagnosis and px.px_participant_id=dx.dx_participant_id
)

select distinct 
    coalesce(replace(m.diagnosis_id, 'DG', 'CN'), replace(m.phenotype_id, 'PH', 'CN')) as condition_id, 
    coalesce(m.source_text_diagnosis, m.source_text_phenotype) as condition_source_text, 
    coalesce(m.dx_age_at_event_days, m.px_age_at_event_days) as age_at_event_days, -- meed to re-think this
    coalesce(m.mondo_id_diagnosis, 'Not Reported') as mondo_id,
    coalesce(m.hpo_id_phenotype, 'Not Reported') hpo_id, 
    coalesce(m.dx_observed, m.px_observed, 'Not Reported') as observed,
    coalesce(m.dx_participant_id, m.px_participant_id) as participant_id
from merged m 