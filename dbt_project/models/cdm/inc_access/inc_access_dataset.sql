{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  dataset_id::text as dataset_id,
  name::text as name,
  description::text as description,
  do_id::text as do_id,
  data_collection_start::text as data_collection_start,
  data_collection_end::text as data_collection_end
from {{ program_ref }}    