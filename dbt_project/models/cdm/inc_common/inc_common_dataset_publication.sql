{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as dataset_dataset_id,
  null::integer as publication_id
from {{ program_ref }}    