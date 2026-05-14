{{ config(materialized='table') }}

    select
    "DOI"::text as "do_id",
    "DOI Citation"::text as "bibliographic_reference",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('study') }}