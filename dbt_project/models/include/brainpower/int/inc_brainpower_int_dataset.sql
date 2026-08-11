{{ config(materialized='table') }}

with base as (
select
  -- null::text as dataset_id,
  d.dataset_name::text as name,
  d.dataset_description::text as description,
  null::text as do_id,
  d.data_collection_start_year::text as data_collection_start,
  d.data_collection_end_year::text as data_collection_end
from {{ ref('inc_brainpower_src_datasets') }} as d
)

select 
  distinct
  base.*,
  {{ normalize_descriptors(descriptor_cols=['name']) }}::text as dataset_descriptor
from base