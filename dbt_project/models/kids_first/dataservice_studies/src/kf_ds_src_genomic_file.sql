{{ config(
    schema='src'
) }}

select * 
from{{ ref('ds_genomic_files') }}
