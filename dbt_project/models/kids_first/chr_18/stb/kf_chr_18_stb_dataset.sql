{{ config(materialized='table') }}

    select
    null::text as "dataset_id",
    null::text as "name",
    null::text as "description",
    null::text as "do_id",
    null::text as "data_collection_start",
    null::text as "data_collection_end"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    