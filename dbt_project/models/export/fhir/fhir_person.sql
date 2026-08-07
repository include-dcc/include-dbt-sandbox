{{ config(materialized='table') }}

    select
    person_id::text as "person_id",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_person') }}
    