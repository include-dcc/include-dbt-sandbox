{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}

    select
    assay_assay_id::text as "assay_assay_id",
    subject_id_subject_id::integer as "subject_id_subject_id"
    from {{ program_ref }}
    