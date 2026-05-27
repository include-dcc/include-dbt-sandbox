{{ config(materialized='table') }}

    select
    null::text as "biospecimencollection_biospecimen_collection_id",
    null::text as "external_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    