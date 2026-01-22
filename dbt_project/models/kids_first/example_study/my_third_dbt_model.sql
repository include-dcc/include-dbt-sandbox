{{ config(materialized='table', schema='kf_example') }}

select 
  id,
  letter
from {{ ref('my_second_dbt_model') }}
left join {{ ref('alphabet_grouping') }} on id = letter_grouping