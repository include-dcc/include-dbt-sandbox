{{ config(materialized='table') }}

    select
    aliquot_id::text as "aliquot_id",
    availability_status::text as "availability_status",
    volume::text as "volume",
    volume_units::text as "volume_units",
    concentration::text as "concentration",
    sample_id::text as "sample_id",
    access_policy_id::text as "access_policy_id"
    from {{ ref('access_aliquot') }}
    