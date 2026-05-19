{{ config(materialized='table') }}

select
    null::text as "subjectassertion_assertion_id",
    code::text as "concept_concept_curie"
from {{ ref('BrainPower_MD_mappings') }}
where table_name = 'Health Conditions' OR table_name = 'Anthropometrics'
    