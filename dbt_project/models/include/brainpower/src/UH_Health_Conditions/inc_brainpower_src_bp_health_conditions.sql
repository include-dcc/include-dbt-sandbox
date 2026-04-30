{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "heart_condition"::integer as "heart_condition",
    "vsd"::integer as "vsd",
    "asd"::integer as "asd",
    "pda"::integer as "pda",
    "avsd"::integer as "avsd",
    "mitral"::integer as "mitral",
    "murmur"::integer as "murmur",
    "hole_no_surgery"::integer as "hole_no_surgery",
    "blood_vessel_surgery"::integer as "blood_vessel_surgery",
    "type1_diabetes"::integer as "type1_diabetes",
    "metabolic_disorder"::integer as "metabolic_disorder",
    "hypertension"::integer as "hypertension",
    "type2_diabetes"::integer as "type2_diabetes",
    "asthma"::integer as "asthma",
    "food_allergies"::integer as "food_allergies",
    "hypothyroidism"::integer as "hypothyroidism"
    from {{ source('brainpower', 'bp_health_conditions') }}
    