{{ config(materialized='view') }}
--use this table to make data available to the model. This is meant to reduce hardcoded values in the model.

-- todo think about how to handle this. Perhaps int_accesspolicy could be the source. dependencies could get sticky, but maybe not.
-- todo think about adding descriptor columns as indexes for quicker joins. this is only really useful for large joins. We may not need them.
-- todo demographics is weird. remember how the model works. it is possbile demographics can just join to accesspolicy and study to get the descriptores. Think about it.
select 
  study_code::text as study_code,
  a.dbgap::text as data_use_accession,
  d.dataset_name::text as dataset_name,
  case
    when dataset_name = 'BrainPower Physical Activity Day' then 'FIXME1'
    when dataset_name = 'BrainPower Physical Activity Person' then 'FIXME2'
    when dataset_name = 'BrainPower Randomization' then 'FIXME3'
    else null
  end as access_policy_hc
from (select * from {{ ref('inc_brainpower_src_study') }}) as a
left join (select
  study_code,
  dataset_name
from {{ ref('inc_brainpower_src_datasets') }}) as d
  using(study_code)
where a.study_code = 'BrainPower'


