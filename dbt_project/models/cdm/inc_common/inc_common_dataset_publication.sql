{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  dataset_dataset_id::text as dataset_dataset_id,
  publication_id::integer as publication_id
from {{ program_ref }}    