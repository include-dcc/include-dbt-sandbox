{{ config(
    schema='src'
) }}

select * 
from{{ ref('ds_sequencing_centers') }}
