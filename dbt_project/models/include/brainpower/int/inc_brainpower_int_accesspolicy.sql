{{ config(materialized='table') }}

with base as (
  select
    -- null::text as access_policy_id, -- Global Id to be generated and joined in the stb model
    a.dbgap::text as data_use_accession,
    -- null::text as data_use_permission,
    d.access_requirements::text as data_use_modifier,
    a.selection_criteria::text as disease_limitation,
    null::text as access_description,
    a.study_website::text as website
  from {{ ref('inc_brainpower_src_datasets') }} as d
  left join (select
    study_code,
    study_website,
    dbgap,
    selection_criteria
  from {{ ref('inc_brainpower_src_study') }}) as a
    on d.study_code = a.study_code
)

select
  distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['access_policy_hc']) }}::text as access_policy_descriptor,
  access_policy_hc::text as data_use_permission
from base, {{ ref('inc_brainpower_int_manual_supplement') }}