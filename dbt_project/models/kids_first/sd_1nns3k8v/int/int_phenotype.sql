{{ config(
    schema='int'
) }}

select distinct 
    kf_id as phenotype_id, 
    participant_id,
    source_text_phenotype, 
    age_at_event_days,
    hpo_id_phenotype,
    observed
from {{ ref('src_phenotype')}}