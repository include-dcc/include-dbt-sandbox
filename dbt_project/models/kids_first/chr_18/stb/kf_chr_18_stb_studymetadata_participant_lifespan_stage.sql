{{ config(materialized='table') }}

    select
    null::text as "studymetadata_study_id",
    null::text as "participant_lifespan_stage"
    from {{ ref('kf_chr_18_src_chr_18_phenotype_data') }}
    