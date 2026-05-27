{{ config(materialized='table') }}

select
    null::integer as "id",
    null::text as "bibliographic_reference",
    string_to_table(s.publication, '|')::text as "website",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('inc_brainpower_src_study') }} as s

union all

select
    null::integer as "id",
    null::text as "bibliographic_reference",
    string_to_table(d.publication, '|')::text as "website",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('inc_brainpower_src_datasets') }} as d