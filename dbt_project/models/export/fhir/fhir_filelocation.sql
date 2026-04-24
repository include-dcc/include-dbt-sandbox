{{ config(materialized='table') }}

    select
    file_location_id::text as "file_location_id",
    location_uri::text as "location_uri",
    file_name::text as "file_name",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_filelocation') }}
    