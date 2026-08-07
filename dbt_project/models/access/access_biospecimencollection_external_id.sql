{{ config(materialized='table') }}

    select
    biospecimencollection_biospecimen_collection_id::text as "biospecimencollection_biospecimen_collection_id",
    external_id::text as "external_id"
    from {{ ref('combined_biospecimencollection_external_id') }}
    