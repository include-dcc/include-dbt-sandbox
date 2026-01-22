{{ config(
    schema='src'
) }}

select * 
from {{ ref('ds_studies') }}