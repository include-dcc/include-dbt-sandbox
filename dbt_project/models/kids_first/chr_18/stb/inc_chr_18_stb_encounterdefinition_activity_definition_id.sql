{{ config(materialized='table') }}

    select
    null::text as "encounterdefinition_encounter_definition_id",
    null::text as "activity_definition_id_activity_definition_id"
    from {{ ref('inc_chr_18_src_chr_18_phenotype_data') }}
    