{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "start_time"::text as "start_time",
    "room_temperature"::integer as "room_temperature",
    "barometric_pressure"::float as "barometric_pressure",
    "room_humidity"::integer as "room_humidity",
    "o2_measured"::float as "o2_measured",
    "co2_measured"::float as "co2_measured"
    from {{ source('brainpower', 'bp_oxygen_kinetics_meta') }}
    