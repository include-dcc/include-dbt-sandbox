{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  assay_assay_id::text as assay_assay_id,
  sample_id_sample_id::integer as sample_id_sample_id
from {{ program_ref }}    