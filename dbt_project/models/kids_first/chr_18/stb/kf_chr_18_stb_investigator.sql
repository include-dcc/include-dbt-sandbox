{{ config(materialized='table') }}

    select
    null::integer as "id",
    null::text as "name",
    null::text as "institution",
    null::text as "investigator_title",
    null::text as "email",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    