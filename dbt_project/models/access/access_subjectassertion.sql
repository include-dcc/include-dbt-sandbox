{{ config(materialized='table') }}

    select
    assertion_id::text as "assertion_id",
    subject_id::text as "subject_id",
    encounter_id::text as "encounter_id",
    assertion_provenance::text as "assertion_provenance",
    age_at_assertion::integer as "age_at_assertion",
    age_at_event::integer as "age_at_event",
    age_at_resolution::integer as "age_at_resolution",
    concept_source::text as "concept_source",
    value_number::text as "value_number",
    value_source::text as "value_source",
    value_unit::text as "value_unit",
    value_unit_source::text as "value_unit_source",
    access_policy_id::text as "access_policy_id",
    study_id::text as "study_id"
    from {{ ref('combined_subjectassertion') }}
    