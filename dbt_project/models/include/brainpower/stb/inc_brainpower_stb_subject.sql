{{ config(materialized='table') }}

    select
    null::text as "subject_id",
    'participant'::text as "subject_type",
    'NCBITaxon:9606'::text as "organism_type",
    null::text as "access_policy_id",
    null::text as "study_id",
    id::text as "external_id"
    from {{ ref('inc_brainpower_src_bp_demographics') }}
    