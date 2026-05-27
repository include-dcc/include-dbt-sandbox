{{ config(materialized='table') }}

select
    null::text as "assertion_id",
    d.id::text as "subject_id",
    null::text as "encounter_id",
    null::text as "assertion_provenance",
    null::integer as "age_at_assertion",
    age_data.age_at_visit::integer as "age_at_event",
    null::integer as "age_at_resolution",
    anno.code::text as "concept",
    d.cond_code::text as "concept_source",
    null::float as "value_number",
    null::text as "value_source",
    null::text as "value_unit",
    null::text as "value_unit_source",
    null::text as "access_policy_id",
    null::text as "study_id",
case 
    when d.cond_code = '1' then 'LOINC:LA9633-4'
    when d.cond_code = '0' then 'LOINC:LA9634-2'
else 'LOINC:LA11884-6'
end as value_concept
 from ({{ dbt_utils.unpivot(
  relation=ref('inc_brainpower_src_bp_health_conditions'),
  exclude=['inc_index', 'id', 'timepoint'],
  cast_to='varchar',
  field_name="health_cond",
  value_name="cond_code"
) }}) as d
left join (select local_code, code from {{ ref('inc_brainpower_src_brainpower_md_mappings') }} where table_name = 'Health Conditions') as anno
    on cast(d.health_cond as text) = cast(anno.local_code as text)
left join (select age_at_visit, timepoint, id from {{ ref('inc_brainpower_src_bp_age_event_latency') }}) as age_data
    on d.id = age_data.id and d.timepoint = age_data.timepoint

union all

select
    null::text as "assertion_id",
    a.id::text as "subject_id",
    null::text as "encounter_id",
    null::text as "assertion_provenance",
    null::integer as "age_at_assertion",
    age_data2.age_at_visit::integer as "age_at_event",
    null::integer as "age_at_resolution",
    anno2.code::text as "concept",
    null::text as "concept_source",
    a.meas_val::float as "value_number",
    null::text as "value_source",
    null::text as "value_unit",
    null::text as "value_unit_source",
    null::text as "access_policy_id",
    null::text as "study_id",
    null::text as "value_concept"
 from ({{ dbt_utils.unpivot(
  relation=ref('inc_brainpower_src_bp_anthropometrics'),
  exclude=['inc_index', 'id', 'timepoint'],
  cast_to='varchar',
  field_name="health_meas",
  value_name="meas_val"
) }}) as a
left join (select local_code, code from {{ ref('inc_brainpower_src_brainpower_md_mappings') }} where table_name = 'Anthropometrics') as anno2
    on cast(a.health_meas as text) = cast(anno2.local_code as text)
left join (select age_at_visit, timepoint, id from {{ ref('inc_brainpower_src_bp_age_event_latency') }}) as age_data2
    on a.id = age_data2.id and a.timepoint = age_data2.timepoint
where a.meas_val is not null
