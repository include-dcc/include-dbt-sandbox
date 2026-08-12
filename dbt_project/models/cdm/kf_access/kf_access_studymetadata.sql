{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    study_id::integer as "study_id",
    selection_criteria::text as "selection_criteria",
    vbr_id::integer as "vbr_id",
    expected_number_of_participants::integer as "expected_number_of_participants",
    actual_number_of_participants::integer as "actual_number_of_participants",
    access_policy_id::text as "access_policy_id"
    from {{ program_ref }}
    