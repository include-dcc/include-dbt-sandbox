{{ config(materialized='table') }}

select
     {{ generate_global_id(prefix='ad',descriptor=['name'], study_id='brainpower') }}::text as "activitydefinition_activity_definition_id",
    table_name::text as "external_id"
from {{ ref('tablename_key') }}
    