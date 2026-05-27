{{ config(materialized='table') }}

select
     {{ generate_global_id(prefix='ad',descriptor=['table_name'], study_id='brainpower') }}::text as "activity_definition_id",
    table_name::text as "name",
    null::text as "description",
    null::text as "access_policy_id",
    null::text as "study_id"
from {{ ref('tablename_key') }}
    