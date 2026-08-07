{{ config(materialized='table') }}

    select
    investigator_id::integer as "investigator_id",
    external_id::text as "external_id"
    from {{ ref('combined_investigator_external_id') }}
    