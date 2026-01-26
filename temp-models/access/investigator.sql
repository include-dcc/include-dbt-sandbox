{{ config(
    schema='access'
) }}

select distinct 
  name,
  institution, 
  'Principle Investigator' as investigator_title,
  'Not Reported' as email,
  external_id
from {{ ref('stable_investigator') }}