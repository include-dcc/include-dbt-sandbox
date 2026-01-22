{{ config(
    schema='access'
) }}

select distinct
  participant_id as subject_id,
  'KF participant' as subject_type, -- adding in KF as a source identifier
  external_id
-- organism_type -- not sure if this is needed. could be set to 'human' if needed
from {{ ref('stable_participant') }}