{{ config(materialized='table') }}

select
    d.id::text as "subject_id",
    gen_map.code::text as "sex",
    eth_map.code::text as "ethnicity",
    null::text as "down_syndrome_status", -- Required but not in src data
    age_data.age_at_visit::integer as "age_at_last_vital_status",
    null::text as "vital_status", -- Unknown, needs new enumeration
    age_data_first.age_at_visit::integer as "age_at_first_engagement",
    null::text as "access_policy_id",
    null::text as "study_id"
from (select * from {{ ref('inc_brainpower_src_bp_demographics') }}) as d
left join (select local_code, code from {{ ref('inc_brainpower_src_brainpower_md_mappings') }} where parent_varname = 'gender') as gen_map
    on cast(d.gender as integer) = cast(gen_map.local_code as integer)
left join (select local_code, code from {{ ref('inc_brainpower_src_brainpower_md_mappings') }} where parent_varname = 'ethnicity') as eth_map
    on cast(d.ethnicity as integer) = cast(eth_map.local_code as integer)
-- {# left join (select enumeration_meaning from {{ ref('inc_kf_access_enums_20260508')}} where enumeration_code = 't21') as t21_data #}
left join (select age_at_visit, timepoint, id from {{ ref('inc_brainpower_src_bp_age_event_latency') }} where timepoint = '5') as age_data
    on d.id = age_data.id
left join (select age_at_visit, timepoint, id from {{ ref('inc_brainpower_src_bp_age_event_latency') }} where timepoint = '1') as age_data_first
    on d.id = age_data_first.id


    -- select
    --     d.gender_info -> 'gender_code' as "sex"
    --     -- d.id::text as "subject_id",
    --     -- d.gender::text as "sex",
    --     -- d.ethnicity::text as "ethnicity",
    --     -- null::text as "down_syndrome_status",
    --     -- null::integer as "age_at_last_vital_status",
    --     -- null::text as "vital_status",
    --     -- null::integer as "age_at_first_engagement",
    --     -- null::text as "access_policy_id",
    --     -- null::text as "study_id"
    -- -- {# {{ dbt_utils.pivot('code', dbt_utils.get_column_values(ref('inc_brainpower_int_bp_demographics'), 'code')) }}
    -- from {{ ref('inc_brainpower_int_bp_demographics') }} as d
    -- -- left join {{ ref('global_identifiers_include_dcc_brainpower') }} as a --annotations
    -- -- on CAST(d.id AS text) = a.descriptor
    -- -- where fhirResourceType = 'Patient' #}