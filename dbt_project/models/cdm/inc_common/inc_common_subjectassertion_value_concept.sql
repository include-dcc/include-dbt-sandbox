{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  null::text as subjectassertion_assertion_id,
  null::text as value_concept_concept_curie
from {{ program_ref }}    