{{ config(materialized='table') }}

select
     null::text as "activitydefinition_activity_definition_id",
    table_name::text as "external_id"
from {{ ref('inc_brainpower_src_tablename_key') }}
    