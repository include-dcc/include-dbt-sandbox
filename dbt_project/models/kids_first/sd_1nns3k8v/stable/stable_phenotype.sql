{{ config(
    schema='stable'
) }}

select distinct 
    uuid,
    phenotype_id, 
    dewrangle_phenotype_id,
    participant_id,
    source_text_phenotype, 
    age_at_event_days,
    hpo_id_phenotype,
    observed,
    snomed_id_phenotype,
    external_id
from {{ ref('int_phenotype')}}
