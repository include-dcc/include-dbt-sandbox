{{ config(materialized='table') }}

    select
    null::text as "family_relationship_id",
    -- is this participant id? same as subject id?
    null::text as "family_member_id",
    -- this study doesn't have families so should this be null? or mapped to an NA value?
    null::text as "relationship",
    null::text as "subject_id",
    null::text as "access_policy_id",
    null::text as "study_id"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    