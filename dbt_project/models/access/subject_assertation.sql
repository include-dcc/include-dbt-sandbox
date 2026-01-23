{{ config(
    schema='access'
) }}

(
  select distinct 
    diagnosis_id as assertion_id, 
    participant_id as subject_id, 
    -- assertion_provenance, -- don't think we have this available in KF
    age_at_event_days as age_at_assertion, -- could also use age_at_event
    -- age_at_event,
    -- age_at_resolution,
    mondo_id_diagnosis as concept_source, -- using mondo as the primary ontology for diagnoses
    -- value_number,
    source_text_diagnosis as value_source -- not sure this is right place
  -- value_units,
  -- value_units_source
  from {{ ref('stable_diagnosis') }}

)

union all

(
  select distinct 
    phenotype_id as assertion_id, 
    participant_id as subject_id, 
    -- assertion_provenance, -- don't think we have this available in KF
    age_at_event_days as age_at_assertion, -- could also use age_at_event
    -- age_at_event,
    -- age_at_resolution,
    hpo_id_phenotype as concept_source, -- using hpo as the primary ontology for phenotypes
    -- value_number,
    source_text_phenotype as value_source -- not sure this is right place
  -- value_units,
  -- value_units_source
  from {{ ref('stable_phenotype') }}
)


