{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

select
  subjectassertion_assertion_id::text as subjectassertion_assertion_id,
  value_concept_concept_curie::text as value_concept_concept_curie
from {{ program_ref }}    