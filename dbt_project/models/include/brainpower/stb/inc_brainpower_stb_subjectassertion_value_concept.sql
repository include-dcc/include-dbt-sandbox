{{ config(materialized='table') }}

select
  null::text as subjectassertion_assertion_id,
  enumeration_meaning::text as value_concept_concept_curie
from {{ ref('inc_brainpower_src_inc_kf_access_enums_20260508') }} 
where table_name = 'Assertion_status'
    