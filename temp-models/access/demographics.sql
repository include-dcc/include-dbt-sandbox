{{ config(
    schema='access'
) }}

select distinct 
  participant_id as subject_id,
  gender as sex,
  race,
  ethnicity,
  'Not Applicable' as down_syndrome_status,
  'Not Reported' as age_at_last_vital_status, -- ideally needs to be pulled from outcome data
  'Not Reported' as vital_status,
  'Not Reported' as age_at_first_engagement,
  external_id
from {{ ref('stable_participant') }}