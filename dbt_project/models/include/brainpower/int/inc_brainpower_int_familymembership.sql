{{ config(materialized='table') }}

select
  null::text as family_membership_id,
  null::text as family_id,
  null::integer as subject_id,
  null::text as family_role,
  null::text as access_policy_id,
  null::integer as study_id
where 1 = 0
    