{{ config(materialized='table') }}

select
    null::text as "access_policy_id",
    a.dbgap::text as "data_use_accession",
    d.access_limitations::text as "data_use_permission",
    d.access_requirements::text as "data_use_modifier",
    a.selection_criteria::text as "disease_limitation",
    null::text as "access_description",
    a.study_website::text as "website"
from {{ ref('inc_brainpower_src_datasets') }} as d
left join (select study_code, study_website, dbgap, selection_criteria from {{ ref('inc_brainpower_src_study') }}) as a
on d.study_code = a.study_code