{{ config(materialized='table') }}

    select
    ROW_NUMBER() OVER () AS "inc_index",
    "id"::integer as "id",
    "timepoint"::integer as "timepoint",
    "norm_gray"::float as "norm_gray",
    "norm_white"::float as "norm_white",
    "norm_lhippo"::float as "norm_lhippo",
    "norm_rhippo"::float as "norm_rhippo",
    "total_icv"::float as "total_icv",
    "total_gray"::float as "total_gray",
    "total_white"::float as "total_white",
    "total_lhippo"::float as "total_lhippo",
    "total_rhippo"::float as "total_rhippo",
    "rspcc_dmnmask"::float as "rspcc_dmnmask",
    "rspcc_mpfc"::float as "rspcc_mpfc",
    "rspcc_lpar"::float as "rspcc_lpar",
    "rspcc_rpar"::float as "rspcc_rpar",
    "dti_fa"::float as "dti_fa",
    "dti_md"::float as "dti_md",
    "pcasl"::float as "pcasl"
    from {{ source('brainpower', 'bp_imaging') }}
    