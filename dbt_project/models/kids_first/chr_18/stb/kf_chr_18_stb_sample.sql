{{ config(materialized='table') }}

    select
    sample as "sample_id",
    null::text as "biospecimen_collection_id",
    null::text as "parent_sample_id",
    type as "sample_type",
    null::text as "availablity_status",
    null::text as "quantity_number",
    null::text as "quantity_unit",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_src_ha_delivery_manifest_6735') }}
    