{{ config(materialized='table') }}

    select
        a.fhirResourceType::text as "subject_id",
        d.gender::text as "sex",
        d.ethnicity::text as "ethnicity",
        null::text as "down_syndrome_status",
        null::integer as "age_at_last_vital_status",
        null::text as "vital_status",
        null::integer as "age_at_first_engagement",
        null::text as "access_policy_id",
        null::text as "study_id"
    from {{ ref('inc_brainpower_src_bp_demographics') }} as d
    left join {{ ref('global_identifiers_include_dcc_brainpower') }} as a --annotations
    on CAST(d.id AS text) = a.descriptor
    where fhirResourceType = 'Patient'