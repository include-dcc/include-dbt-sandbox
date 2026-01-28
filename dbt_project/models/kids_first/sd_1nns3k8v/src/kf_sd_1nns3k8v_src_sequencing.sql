{{ config(
    schema='src'
) }}

select * 
from {{ ref('sample') }}