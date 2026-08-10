{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    assay_id::text as "assay_id",
    assay_type::text as "assay_type",
    assay_source::text as "assay_source",
    activity_definition_id::text as "activity_definition_id",
    access_policy_id::text as "access_policy_id",
    study_id::integer as "study_id"
    from {{ program_ref }}
    