{{ config(materialized='table') }}

    select
    "inc_index",
    "id",
    "timepoint",
    "gender",
    "level_support",
    "race",
    "ethnicity"
    from {{ ref('inc_brainpower_src_bp_demographics') }} as d
    join (select * from {{ ref('global_identifiers_include_dcc_brainpower') }} ) as a --annotations
    on CAST(d.id AS text) = a.descriptor
