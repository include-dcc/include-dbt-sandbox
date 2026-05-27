{{ config(materialized='table') }}

select
    "doi"::text as "do_id",
    "doi_citation"::text as "bibliographic_reference",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('inc_brainpower_src_study') }}