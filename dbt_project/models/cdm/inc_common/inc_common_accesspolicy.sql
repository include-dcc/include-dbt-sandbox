{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='inc_program') -%}

    select
    null::text as "access_policy_id",
    null::text as "data_use_accession",
    null::text as "data_use_permission",
    null::text as "data_use_modifier",
    null::text as "disease_limitation",
    null::text as "access_description",
    null::text as "website"
    from {{ program_ref }}    