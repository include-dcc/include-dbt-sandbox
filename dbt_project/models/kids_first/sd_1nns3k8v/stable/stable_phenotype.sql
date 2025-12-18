{{ config(
    schema='stable'
) }}

select distinct 
    phenotype_id, 
    participant_id,
    source_text_phenotype, 
    age_at_event_days,
    hpo_id_phenotype,
    observed
from {{ ref('int_phenotype')}}