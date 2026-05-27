{{ config(materialized='table') }}

select
    {{ generate_global_id(prefix='gp',descriptor=['dataset_name'], study_id='brainpower') }}::text as "dataset_id",
    d.dataset_name::text as "name",
    d.dataset_description::text as "description",
    null::text as "do_id",
    d.data_collection_start_year::text as "data_collection_start",
    d.data_collection_end_year::text as "data_collection_end"
from {{ ref('inc_brainpower_src_datasets') }} as d