{{ config(materialized='table') }}

with base as (
select
  d.id::text as subject_id,
  gen_map.code::text as sex,
  eth_map.code::text as ethnicity,
  null::text as down_syndrome_status, -- Required but not in src data
  age_data.age_at_visit::integer as age_at_last_vital_status,
  null::text as vital_status, -- Unknown, needs new enumeration
  age_data_first.age_at_visit::integer as age_at_first_engagement
  -- null::text as access_policy_id,
  -- null::text as study_id
from (select * from {{ ref('inc_brainpower_src_bp_demographics') }}) as d
left join (select
  local_code,
  code
from {{ ref('inc_brainpower_src_brainpower_md_mappings') }}
where parent_varname = 'gender') as gen_map
  on (d.gender)::integer = (gen_map.local_code)::integer
left join (select
  local_code,
  code
from {{ ref('inc_brainpower_src_brainpower_md_mappings') }}
where parent_varname = 'ethnicity') as eth_map
  on (d.ethnicity)::integer = (eth_map.local_code)::integer
-- {# left join (select enumeration_meaning from {{ ref('inc_kf_access_enums_20260508')}} where enumeration_code = 't21') as t21_data #}
left join (select
  age_at_visit,
  timepoint,
  id
from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
where timepoint = '5') as age_data
  on d.id = age_data.id
left join (select
  age_at_visit,
  timepoint,
  id
from {{ ref('inc_brainpower_src_bp_age_event_latency') }}
where timepoint = '1') as age_data_first
  on d.id = age_data_first.id
)
,study_info as ( -- todo think about how to handle this. Perhaps int_accesspolicy could be the source. dependencies could get sticky, but maybe not.
-- todo think about adding descriptor columns as indexes for quicker joins. this is only really useful for large joins. We may not need them.
-- todo demographics is weird. remember how the model works. it is possbile demographics can just join to accesspolicy and study to get the descriptores. Think about it.
select
  {{ normalize_descriptors(descriptor_cols=['policy_id','data_use_accession']) }}::text as access_policy_descriptor
from (select 'HARD CODED ACCESS POLICY IDENTIFIER'::text as policy_id, -- This is why hard coding is not ideal. This id should come from the src data somewhere.
      dbgap::text as data_use_accession
      from {{ ref('inc_brainpower_src_study') }}
      ) as a
)

select 
  base.*,
  study_info.access_policy_descriptor,
  {{ normalize_descriptors(descriptor_cols=['subject_id']) }}::text as subject_descriptor,
  {{ normalize_descriptors(descriptor_str='brainpower') }}::text as study_descriptor
from base, study_info