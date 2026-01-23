{{ config(
    schema='src'
) }}

select * 
from {{ ref('kids_first_update') }}