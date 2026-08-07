{{ config(materialized='table') }}

    select
    participant_assertion_id::text as "participant_assertion_id",
    participant_id::text as "participant_id",
    age_at_event::text as "age_at_event",
    age_at_assertion::text as "age_at_assertion",
    age_at_onset::text as "age_at_onset",
    age_at_resolution::text as "age_at_resolution",
    entity_asserter::text as "entity_asserter",
    other_condition_modifiers::text as "other_condition_modifiers",
    assertion_type::text as "assertion_type",
    assertion_code::text as "assertion_code",
    assertion_text::text as "assertion_text",
    assertion_source::text as "assertion_source",
    value_code::text as "value_code",
    value_string::text as "value_string",
    value_number::text as "value_number",
    value_units::text as "value_units",
    body_site::text as "body_site",
    body_location::text as "body_location",
    body_laterality::text as "body_laterality",
    cancer_stage::text as "cancer_stage",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_participantassertion') }}
    