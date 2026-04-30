{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "predicted_max_hr"::float as "predicted_max_hr",
    "measured_peak_hr"::integer as "measured_peak_hr",
    "speed"::float as "speed",
    "incline"::float as "incline",
    "time_to_peak"::integer as "time_to_peak",
    "vo2_l_min"::float as "vo2_l_min",
    "vo2_ml_kg_min"::float as "vo2_ml_kg_min",
    "rer"::float as "rer",
    "criteria_exhaustion"::integer as "criteria_exhaustion",
    "criteria_hr10"::integer as "criteria_hr10",
    "criteria_rer"::integer as "criteria_rer",
    "valid_peak_test"::integer as "valid_peak_test"
    from {{ source('brainpower', 'bp_oxygen_kinetics_group') }}
    