{{ config(materialized='table') }}

select
    null::text as "subject_id",
    null::text as "subject_type",
    null::text as "organism_type",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::text as "external_id"
from {{ ref('inc_brainpower_src_inc_kf_access_enums_20260508') }} where enumeration_code = 'participant'
    
    