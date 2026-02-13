{{ config(
    schema='src'
) }}

select * 
from{{ ref('ds_participants') }}
