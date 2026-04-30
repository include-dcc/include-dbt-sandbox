{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "mtticmd"::float as "mtticmd",
    "mttlmd"::float as "mttlmd",
    "mttmtcmd"::float as "mttmtcmd",
    "mtttic"::integer as "mtttic",
    "palfams"::integer as "palfams",
    "paltea"::integer as "paltea",
    "rtifmdmt"::float as "rtifmdmt",
    "rtifmdrt"::float as "rtifmdrt",
    "rtismdmt"::float as "rtismdmt",
    "rtismdrt"::float as "rtismdrt"
    from {{ source('brainpower', 'bp_cognitive_function') }}
    