
{{ config(materialized='table') }}
{%- set program_ref = generate_source_ref_from_current_model(prefix='kf_program') -%}


    select
    access_policy_id::text as "access_policy_id",
    data_use_accession::text as "data_use_accession",
    data_use_permission::text as "data_use_permission",
    data_use_modifier::text as "data_use_modifier",
    disease_limitation::text as "disease_limitation",
    nuaccess_descriptionll::text as "access_description",
    website::text as "website"
    from {{ program_ref }}
    