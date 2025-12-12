{{ config(
    schema='int'
) }}

select distinct 
    kf_id as family_id, 
    lower(replace(kf_id, '_', '-')) as dewrangle_family_id,
    external_id, 
    family_type, -- not historically populated but it should be; can use logic rules to calculate
    visible,
    visibility_reason,
    visibility_comment
from {{ ref('src_family')}}