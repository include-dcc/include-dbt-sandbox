{{ config(
    schema='stable'
) }}

select distinct 
  family_id,
  dewrangle_family_id,
  external_id,
  family_type,
  visible,
  visibility_reason,
  visibility_comment
from {{ ref('int_family') }}


