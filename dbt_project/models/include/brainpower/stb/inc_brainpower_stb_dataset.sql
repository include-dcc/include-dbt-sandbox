{{ config(materialized='table') }}

select
    {{ generate_global_id(prefix='gp',descriptor=["Dataset Name"], study_id='brainpower') }}::text as "dataset_id",
    d."Dataset Name"::text as "name",
    d."Dataset Description"::text as "description",
    null::text as "do_id",
    d."Data Collection Start Year"::text as "data_collection_start",
    d."Data Collection End Year"::text as "data_collection_end"
from {{ ref('datasets') }} as d
    