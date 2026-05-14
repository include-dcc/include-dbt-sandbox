{{ config(materialized='table') }}

select
    null::text as "access_policy_id",
    a."dbGaP"::text as "data_use_accession",
    d."Access Limitations"::text as "data_use_permission",
    d."Access Requirements"::text as "data_use_modifier",
    a."Selection Criteria"::text as "disease_limitation",
    null::text as "access_description",
    a."Study Website"::text as "website"
from {{ ref('datasets') }} as d
left join (select "Study Code", "Study Website", "dbGaP", "Selection Criteria" from {{ ref('study') }}) as a
on d."Study Code" = a."Study Code"