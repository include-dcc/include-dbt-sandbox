{{ config(
    schema='src'
) }}

select * 
from{{ ref('ds_family_relationships') }}
