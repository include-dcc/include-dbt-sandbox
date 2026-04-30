{{ config(materialized='table') }}

    select
    sample_id::text as "sample_id",
    parent_sample_id::text as "parent_sample_id",
    participant_id::text as "participant_id",
    sample_type::text as "sample_type",
    age_at_collection::text as "age_at_collection",
    collection_method::text as "collection_method",
    collection_site::text as "collection_site",
    spatial_qualifier::text as "spatial_qualifier",
    laterality::text as "laterality",
    availability_status::text as "availability_status",
    storage_method::text as "storage_method",
    quantity::text as "quantity",
    quantity_units::text as "quantity_units",
    access_policy_id::text as "access_policy_id"
    {# from {{ ref('') }} #} -- COMMENTED OUT TO AVOID ERROR, REPLACE WITH APPROPRIATE REF
    