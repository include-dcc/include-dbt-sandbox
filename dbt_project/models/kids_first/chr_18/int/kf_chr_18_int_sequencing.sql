{{ config(materialized='table') }}

    with base as (
        select
            sample_id,
            collaborator_sample_id,
            data_type,
            collaborator_participant_id,
            root_sample_id,
            total_reads,
            mean_read_length,
            reference_sequence_name
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }}
    ),

    crams as (
        select
        root_sample_id,
        cram_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} 
    ),

    crais as (
        select
        root_sample_id,
        crai_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} as crais
    ),

    md5s as (
        select
        root_sample_id,
        md5_path
        from {{ ref('kf_chr_18_src_terra_manifest_v2') }} as md5s
    )

    select 
    base.sample_id,
    base.collaborator_sample_id,
    base.data_type,
    base.collaborator_participant_id,
    base.root_sample_id,
    base.total_reads,
    base.mean_read_length,
    base.reference_sequence_name,
    crams.cram_path,
    crais.crai_path,
    md5s.md5_path
    from base
    left join crams
    on base.root_sample_id = crams.root_sample_id
    left join crais
    on base.root_sample_id = crais.root_sample_id
    left join md5s
    on base.root_sample_id = md5s.root_sample_id