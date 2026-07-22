{{ config(materialized='table') }}

with base as (
select
  'HARD CODED ACCESS POLICY IDENTIFIER'::text as policy_id, -- Example of how to hard code a value to use as a descriptor
  -- null::text as access_policy_id, -- Global Id to be generated and joined in the stb model
  a.dbgap::text as data_use_accession,
  d.access_limitations::text as data_use_permission,
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

select *
,{{ normalize_descriptors(descriptor_cols=['policy_id','data_use_accession']) }}::text as access_policy_descriptor -- access_policy_descriptor will be the column given to the stb model for joining to the global Id table.
from base