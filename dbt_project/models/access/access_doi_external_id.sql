{{ config(materialized='table') }}

    select
    doi_do_id::text as "doi_do_id",
    external_id::text as "external_id"
    from {{ ref('combined_doi_external_id') }}
    