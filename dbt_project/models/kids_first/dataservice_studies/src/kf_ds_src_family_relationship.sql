{{ config(
    schema='src'
) }}

select * 
from{{ source('kf_ds_src', 'ds_family_relationships') }}
