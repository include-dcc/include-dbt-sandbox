{{ config(materialized='table') }}

select
    null::integer as "id",
    null::text as "bibliographic_reference",
    string_to_table(s."Publication", '|')::text as "website",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('study') }} as s

union all

select
    null::integer as "id",
    null::text as "bibliographic_reference",
    string_to_table(d."Publication", '|')::text as "website",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('datasets') }} as d