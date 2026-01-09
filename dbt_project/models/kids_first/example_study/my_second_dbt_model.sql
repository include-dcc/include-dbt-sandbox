{{ config(materialized='table', schema='kf_example') }}
-- Use the `ref` function to select from other models

select *
from {{ ref('my_first_dbt_model') }}
where id = 1
